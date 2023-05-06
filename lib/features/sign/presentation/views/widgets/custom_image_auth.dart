import 'package:flutter/material.dart';
class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Logo.png"),
        ),
      ),
    );
  }
}
