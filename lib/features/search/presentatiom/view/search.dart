
import 'package:bookly/features/search/presentatiom/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.bookName}) : super(key: key);
  final String bookName;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
