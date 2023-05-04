import 'package:bookly/core/widgets/error_message.dart';
import 'package:bookly/costants.dart';
import 'package:bookly/features/home/presenation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/shimmer_effect_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../../../../../core/utils/router.dart';
import 'custom_image_item.dart';

class FeaturedListViewItems extends StatelessWidget {
  const FeaturedListViewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
  builder: (context, state) {
   if(state is FeaturedBooksSuccess){
     return SizedBox(
       height: MediaQuery.of(context).size.height*.33,
       child: ListView.builder(
         physics: const BouncingScrollPhysics(),
         itemCount: state.books.length ,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index) =>  Padding(
           padding: const EdgeInsets.only(right: 15),
           child: GestureDetector(
               onTap: (){
                 GoRouter.of(context).push(AppRouter.bookDetailsView, extra: state.books[index],);
               },
               child: CustomImageItem(imageUrl: state.books[index].volumeInfo.imageLinks?.smallThumbnail??errImage)),
         ),),
     );
   }else if(state is FeaturedBooksFailure){
     return CustomErrorMessage(errMessage: state.errMessage);
   }else{
     return const ShimmerEffectImages(size: 0.33,);
   }
  },
);
  }
}