import 'package:flutter/material.dart';
import 'package:intweet_aplikation/pages/chat_overview.dart';
import 'package:intweet_aplikation/pages/creation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Creation(),
    );
  }
}
