import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../costants.dart';

class SignSwitchRow extends StatelessWidget {
  const SignSwitchRow({Key? key, required this.textSign, required this.isTextSign, required this.switchSign}) : super(key: key);
  final String textSign;
  final String isTextSign;
  final String switchSign;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Text(
          isTextSign,
          style: TextStyle(color: kSecondColor, fontSize: 16),
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).go(switchSign);
            },
            child: Text(
                textSign,
                style: Styles.textStyle16
            )),
      ],
    );
  }
}
