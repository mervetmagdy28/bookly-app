import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SignRow extends StatelessWidget {
  const SignRow({Key? key, required this.signTitle}) : super(key: key);
  final String signTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          signTitle,
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
