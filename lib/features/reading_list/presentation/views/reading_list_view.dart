import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/costants.dart';
import 'package:bookly/features/reading_list/presentation/views/widgets/reading_list_view_body.dart';
import 'package:flutter/material.dart';


class ReadingListView extends StatelessWidget {
  const ReadingListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Reading List ",style: Styles.textStyle18,),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: ReadingListViewBody(),
          )
      ),
    );
  }
}
