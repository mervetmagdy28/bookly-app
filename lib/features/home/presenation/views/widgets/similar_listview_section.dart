import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'similar_list_view.dart';

class SimilarListViewSection extends StatelessWidget {
  const SimilarListViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also Like",style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),),
        const SizedBox(height: 10,),
        const SimilarListView(),
      ],
    );
  }
}
