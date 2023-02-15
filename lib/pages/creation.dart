import 'package:flutter/material.dart';
import 'package:intweet_aplikation/components/buttons.dart';
import 'package:intweet_aplikation/components/costum_input.dart';
import 'package:intweet_aplikation/components/top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Creation extends StatefulWidget {
  Creation({super.key});

  @override
  State<Creation> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<Creation> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

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
              onPressed: () {},
              margin: const EdgeInsets.only(top: 64),
              padding: const EdgeInsets.only(
                  bottom: 16, top: 16, left: 32, right: 32),
              label: const Text("Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }
}
