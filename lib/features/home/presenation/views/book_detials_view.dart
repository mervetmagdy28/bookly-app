import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: BookDetailsViewBody(bookModel: bookModel),
      ),
    );
  }
}
