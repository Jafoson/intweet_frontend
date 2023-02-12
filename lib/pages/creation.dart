import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intweet_aplikation/components/costum_input.dart';
import 'package:intweet_aplikation/components/costum_searchbar.dart';
import 'package:intweet_aplikation/components/top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Creation extends StatelessWidget {
  const Creation({super.key});

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
            const CustomInput(
              tag: "Username",
              prefixIcon: Icons.person,
            ),
            const CustomInput(
              tag: "E-Mail",
              prefixIcon: Icons.email,
              margin: EdgeInsets.only(top: 16),
            ),
            const CustomInput(
              password: true,
              tag: "Password",
              prefixIcon: Icons.lock,
              margin: EdgeInsets.only(top: 16),
            ),
            const CustomInput(
              password: true,
              tag: "Repeat password",
              prefixIcon: Icons.lock,
              margin: EdgeInsets.only(top: 16),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    textAlign: TextAlign.right,
                    "Forgot Passwort?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff4A9387),
                        decoration: TextDecoration.underline),
                    maxLines: 1,
                  )),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 64),
              child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      backgroundColor: const Color(0xff4A9387),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xffD5FAFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
