import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.textColor, required this.backgroundColor, required this.borderRadius, required this.fontSize, this.onPressed}) : super(key: key);
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double fontSize;
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(onPressed: onPressed, style: TextButton.styleFrom(
          backgroundColor:backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius
          )
      ),child: Text(text,style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w900),),),
    );
  }
}
