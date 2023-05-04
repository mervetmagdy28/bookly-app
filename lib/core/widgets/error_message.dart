import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({Key? key, required this.errMessage}) : super(key: key);
  final String errMessage;
  
  @override
  Widget build(BuildContext context) {
    return Text(errMessage);
  }
}
