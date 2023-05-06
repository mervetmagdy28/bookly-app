import 'package:bookly/features/sign/presentation/views/widgets/sign_row.dart';
import 'package:bookly/features/sign/presentation/views/widgets/sign_switch_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/router.dart';
import 'custom_auth_button.dart';
import 'custom_image_auth.dart';
import 'custom_text_form_field.dart';

class SignInBody extends StatelessWidget {
   SignInBody({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Form(
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
            const SignRow(signTitle: 'LOGIN',),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: email,
                validator: (data) {
                  if (data!.isEmpty) return "field is required";
                },
                hintText: 'email'),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(controller: password, validator: (data) {
              if (data!.isEmpty) return "field is required";
              return null;
            }, hintText: 'password',obscureText: true,),
            const SizedBox(
              height: 20,
            ),
            CustomAuthButton(
              onTap: () async{
                if (_key.currentState!.validate()) {
                  try {
                    await loginUser();
                    GoRouter.of(context).go(AppRouter.homeView);
                  }
                  on FirebaseAuthException
                  catch (ex) {
                    if (ex.code == 'user-not-found') {
                      showSnackBar(context, 'user not found');
                    } else if (ex.code == 'wrong-password') {
                      showSnackBar(context, 'wrong password');
                    }
                  } catch (ex) {
                    print(ex);
                    showSnackBar(context, 'there was an error');
                  }
                }
              },
              text: "LOGIN",
            ),
            const SizedBox(
              height: 20,
            ),
            SignSwitchRow(textSign: 'REGISTER', isTextSign: 'don\'t have an account? ', switchSign: AppRouter.signUp),

          ],
        ),
      ),
    );
  }
  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
