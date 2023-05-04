import 'package:bookly/features/home/presenation/views/widgets/button_row.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_book_details_appBar.dart';
import 'package:bookly/features/home/presenation/views/widgets/similar_listview_section.dart';
import 'package:flutter/material.dart';
import '../../../data/models/book_model.dart';
import 'book_details_section.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
           hasScrollBody: false,
            child:Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                   const CustomBookDetailsAppBar(),
                   BookDetailsSection(bookModel: bookModel),
                   ButtonRow(bookModel: bookModel),
                   const Expanded(child: SizedBox(height: 10,)),
                   const SimilarListViewSection(),
                   const SizedBox(height: 20,)
                ],
              ),
            ),
        )
      ],
    );

  }
}
