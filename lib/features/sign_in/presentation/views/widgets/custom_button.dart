import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/costants.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  CustomAuthButton({Key? key, this.onTap, required this.text}) : super(key: key);
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle20,
          ),
        ),
      ),
    );
  }
}
