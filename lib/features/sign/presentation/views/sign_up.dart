
import 'package:bookly/features/sign/presentation/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignUpBody(),
      ),
    );
  }
}
