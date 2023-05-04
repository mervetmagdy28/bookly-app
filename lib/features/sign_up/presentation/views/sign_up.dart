import 'package:bookly/core/utils/router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/costants.dart';
import 'package:bookly/features/sign_in/presentation/views/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 30,),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: const [
                    Text(
                      "SIGNUP",
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) return "field is required";
                  },
                  cursorColor: Colors.white,
                  controller: email,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration:  const InputDecoration(
                      hintText: "email",
                      // fillColor: kSecondColor,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                        BorderSide(
                          //color: kSecondColor,
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(
                          // color: kSecondColor,
                            width: 1),
                      ),
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  validator: (data) {
                    if (data!.isEmpty) return "field is required";
                    return null;
                  },
                  cursorColor: Colors.white,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration:  const InputDecoration(
                      hintText: "password",
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                        BorderSide(
                          //color: kSecondColor,
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(
                          // color: kSecondColor,
                            width: 1),
                      ),
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "field is required";
                    }
                    else if(password.text!=confirmPassword.text) {
                      return "not the same password";
                    }
                    return null;
                  },
                  controller: confirmPassword,
                  obscureText: true,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration:  const InputDecoration(
                    hintText: "confirm password",
                    // fillColor: kSecondColor,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                      BorderSide(
                        //color: kSecondColor,
                          width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(
                        // color: kSecondColor,
                          width: 1),
                    ),
                  ),
                ),
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
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "I have an account! ",
                      style: TextStyle(color: kSecondColor, fontSize: 16),
                    ),
                    GestureDetector(
                        onTap: () {
                         GoRouter.of(context).replace(AppRouter.signIn);
                        },
                        child: const Text(
                          "LOGIN",
                          style:Styles.textStyle18,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: password.text);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
