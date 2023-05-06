import 'package:bookly/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/book_model.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key, required this.books}) : super(key: key);
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.close)),
        IconButton(onPressed: (){
          GoRouter.of(context).replace(AppRouter.readingList,extra: books);
        }, icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
