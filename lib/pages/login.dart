import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intweet_aplikation/service/database_services.dart';

import '../components/buttons.dart';
import '../components/costum_input.dart';
import '../components/top_bar.dart';
import '../components/widgets.dart';
import '../helper/helper_function.dart';
import '../service/auth_service.dart';
import 'chat_overview.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthService authService = AuthService();

  bool _isloading = false;
  bool _allFieldValid = false;

  void _updateTextFieldFilledStatus() {
    setState(() {
      _allFieldValid =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTextFieldFilledStatus();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C3333),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff2C3333),
          elevation: 0,
        ),
        body: _isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff4A9387),
                ),
              )
            : Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Center(
                          child: SvgPicture.asset("assets/svg/Logo4.svg",
                              width: 325, semanticsLabel: 'Acme Logo')),
                      const Padding(padding: EdgeInsets.only(top: 80)),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        child: const Text(
                          "Welcome Back",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomInput(
                        onChanged: (text) => _updateTextFieldFilledStatus(),
                        controller: emailController,
                        tag: "E-Mail",
                        prefixIcon: Icons.mail,
                      ),
                      CustomInput(
                        onChanged: (text) => _updateTextFieldFilledStatus(),
                        controller: passwordController,
                        tag: "Password",
                        password: true,
                        prefixIcon: Icons.lock,
                        margin: const EdgeInsets.only(top: 16),
                      ),
                      // SecondaryButton(
                      //     alignment: Alignment.centerRight,
                      //     onPressed: () {},
                      //     label: const Text(
                      //       "Forgot Password",
                      //       maxLines: 1,
                      //       style: TextStyle(
                      //           color: Color(0xff4A9387),
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600),
                      //     )),
                      PrimaryButton(
                        active: _allFieldValid,
                        onPressed: () {
                          login();

                          //if (passwordController.text == repeatPasswordController.text) {
                          //  print("FUNKTIONIERT!!!!!!!");
                          //} else {
                          //  print("HUNDESOHN");
                          //}
                        },
                        margin: const EdgeInsets.only(top: 64),
                        padding: const EdgeInsets.only(
                            bottom: 16, top: 16, left: 32, right: 32),
                        label: const Text("Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      toSignUp()
                    ],
                  ),
                ),
              ));
  }

  toSignUp() {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Dont have a Account?",
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SecondaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signUp");
                  },
                  label: const Text(
                    "Sign Up",
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff4A9387),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ));
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await authService
          .loginWithUserNameandPassword(
              emailController.text, passwordController.text)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(emailController.text);
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(emailController.text);
          await HelperFunction.saveUserNameSF(snapshot.docs[0]["userName"]);
          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomePage())));
        } else {
          showSnackbar(
            context,
            Colors.red,
            value,
          );
          setState(() {
            _isloading = false;
          });
        }
      });
    }
  }
}
