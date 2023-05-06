import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller, required this.validator, required this.hintText, this.obscureText=false}) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration:  InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder:buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide:
        BorderSide(
          //color: kSecondColor,
            width: 1),
      );
  }
}
