import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/buttons.dart';
import '../components/costum_input.dart';
import '../components/top_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameOremailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _allFieldValid = false;

  void _updateTextFieldFilledStatus() {
    setState(() {
      _allFieldValid = usernameOremailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTextFieldFilledStatus();
  }

  @override
  void dispose() {
    usernameOremailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C3333),
      appBar: TopBar(
        key: UniqueKey(),
        actions: false,
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            )),
      ),
      body: Container(
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
              controller: usernameOremailController,
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
                print(usernameOremailController.text);
                // Navigator.popAndPushNamed(context, "/overview");
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
    );
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

  login() {}
}
