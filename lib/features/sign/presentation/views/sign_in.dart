import 'package:bookly/features/sign/presentation/views/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SignInBody()
      ),
    );
  }

}
