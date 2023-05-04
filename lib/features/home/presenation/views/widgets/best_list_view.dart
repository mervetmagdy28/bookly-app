import 'package:bookly/features/home/presenation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/shimmer_effect_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/error_message.dart';
import 'best_seller_list_view_item.dart';

class BestListView extends StatelessWidget {
  const BestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
          return ListView.builder(
              physics: const ScrollPhysics(),
              itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListViewItem(bookModel: state.books[index],),
              )),
               itemCount: state.books.length);
        }else if (state is NewestBooksFailure){
          return CustomErrorMessage(errMessage: state.errMessage);
        }else{
          return const ShimmerEffectContainer();
        }
      },
    );
  }
}
