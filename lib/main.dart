import 'package:flutter/material.dart';
import 'package:intweet_aplikation/pages/chat.dart';
import 'package:intweet_aplikation/pages/chat_overview.dart';
import 'package:intweet_aplikation/pages/creation.dart';
import 'package:intweet_aplikation/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/signIn": (context) => const Login(),
        "/signUp": (context) => const Creation(),
        "/overview": (context) => const ChatOverview()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Chat(),
    );
  }
}
