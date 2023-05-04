import 'package:bookly/costants.dart';
import 'package:bookly/features/home/presenation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/shimmer_effect_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

import '../../../../../core/utils/router.dart';
import '../../../../../core/widgets/error_message.dart';
import 'custom_image_item.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context, state){
        if(state is SimilarBooksSuccess){
          return  SizedBox(
              height: MediaQuery.of(context).size.height*.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).replace(AppRouter.bookDetailsView, extra: state.books[index],);
                      },
                      child: CustomImageItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? errImage)
                  ),
                ),)
          );
        }else if (state is SimilarBooksFailure){
          return CustomErrorMessage(errMessage: state.errMessage);
        }else{
          return const ShimmerEffectImages(size: 0.15,);
        }
      }
    );
  }
}
