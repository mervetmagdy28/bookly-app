import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/best_list_view.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              CustomAppBar(),
              FeaturedListViewItems(),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("Newest Seller", style: Styles.textStyle18,),
              ),
               ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BestListView(),
          )
        )
      ],

    );
  }
}
