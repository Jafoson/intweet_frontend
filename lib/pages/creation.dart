import 'package:flutter/material.dart';
import 'package:intweet_aplikation/components/buttons.dart';
import 'package:intweet_aplikation/components/costum_input.dart';
import 'package:intweet_aplikation/components/top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intweet_aplikation/helper/helper_function.dart';
import 'package:intweet_aplikation/pages/chat_overview.dart';
import 'package:intweet_aplikation/service/auth_service.dart';

import '../components/widgets.dart';

class Creation extends StatefulWidget {
  const Creation({super.key});

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  AuthService authService = AuthService();

  bool _isloading = false;
  bool _allFieldValid = false;

  void _updateTextFieldFilledStatus() {
    setState(() {
      _allFieldValid = usernameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          repeatPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTextFieldFilledStatus();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
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
            ? Center(
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
                          "Create Account",
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
                        controller: usernameController,
                        tag: "Username",
                        prefixIcon: Icons.person,
                      ),
                      CustomInput(
                        onChanged: (text) => _updateTextFieldFilledStatus(),
                        controller: emailController,
                        tag: "E-Mail",
                        prefixIcon: Icons.email,
                        margin: const EdgeInsets.only(top: 16),
                      ),
                      CustomInput(
                        onChanged: (text) => _updateTextFieldFilledStatus(),
                        controller: passwordController,
                        password: true,
                        tag: "Password",
                        prefixIcon: Icons.lock,
                        margin: const EdgeInsets.only(top: 16),
                      ),
                      CustomInput(
                        onChanged: (text) => _updateTextFieldFilledStatus(),
                        controller: repeatPasswordController,
                        password: true,
                        tag: "Repeat password",
                        prefixIcon: Icons.lock,
                        margin: const EdgeInsets.only(top: 16),
                      ),
                      PrimaryButton(
                        active: _allFieldValid,
                        onPressed: () {
                          if (passwordController.text ==
                              repeatPasswordController.text) {
                            register();
                            // Navigator.popAndPushNamed(context, "/overview");
                          } else {
                            print("HUNDESOHN");
                          }
                        },
                        margin: const EdgeInsets.only(top: 64),
                        padding: const EdgeInsets.only(
                            bottom: 16, top: 16, left: 32, right: 32),
                        label: const Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      toSignIn()
                    ],
                  ),
                ),
              ));
  }

  toSignIn() {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have any Account?",
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SecondaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signIn");
                  },
                  label: const Text(
                    "Sign In",
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await authService
          .registerUserWithEmailandPassword(usernameController.text,
              emailController.text, passwordController.text)
          .then((value) async {
        if (value == true) {
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(emailController.text);
          await HelperFunction.saveUserNameSF(usernameController.text);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ChatOverview())));
        } else {
          showSnackBar(
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
