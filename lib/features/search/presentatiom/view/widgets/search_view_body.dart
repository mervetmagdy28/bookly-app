import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentatiom/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/error_message.dart';
import '../../../../home/presenation/views/widgets/best_seller_list_view_item.dart';
import '../../../../home/presenation/views/widgets/shimmer_effect_container.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Search Result", style: Styles.textStyle18,),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListViewItem(bookModel: state.books[index],),
                      )),
                      itemCount: state.books.length),
                )
              ],
            ),
          );
        }else if (state is SearchFailure){
          return CustomErrorMessage(errMessage: state.errMessage);
        }else {
          return const ShimmerEffectContainer();
        }
      },
    );
  }
}
