import 'package:bookly/features/sign/presentation/views/widgets/custom_image_auth.dart';
import 'package:bookly/features/sign/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly/features/sign/presentation/views/widgets/sign_row.dart';
import 'package:bookly/features/sign/presentation/views/widgets/sign_switch_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/router.dart';
import '../../../../../costants.dart';
import 'custom_auth_button.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            const CustomImageAuth(),
            const SizedBox(
              height: 60,
            ),
            const SignRow(signTitle: 'SIGNUP'),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: email,
                validator: (data) {
                  if (data!.isEmpty) return "field is required";
                },
                hintText: 'email'
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                controller: password,
                validator: (data) {
                  if (data!.isEmpty) return "field is required";
                  return null;
                },
                hintText: 'password',
              obscureText: true,
            ),

            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                controller: confirmPassword,
                obscureText: true,
                validator: (data) {
                  if (data!.isEmpty) {
                    return "field is required";
                  }
                  else if(password.text!=confirmPassword.text) {
                    return "not the same password";
                  }
                  return null;
                },
                hintText: 'confirm password'),
            const SizedBox(
              height: 20,
            ),
            CustomAuthButton(
              onTap: () async {

                if (_key.currentState!.validate()) {
                  try {
                    await registerUser();
                    GoRouter.of(context).go(AppRouter.homeView);
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'email-already-in-use') {
                      showSnackBar(context, 'email already exists');
                    } else if (ex.code == 'weak-password') {
                      showSnackBar(context, 'weak password');
                    }
                  } catch (ex) {
                    showSnackBar(context, 'there was an error');
                  }
                }
              },
              text: "SIGNUP",
            ),
            const SizedBox(
              height: 20,
            ),
            SignSwitchRow(textSign: 'LOGIN', isTextSign: 'I have an account!', switchSign: AppRouter.signIn)
          ],
        ),
      ),
    );
  }
  Future<void> registerUser() async {

    UserCredential user = await auth .createUserWithEmailAndPassword(email: email.text, password: password.text);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
