import 'package:flutter/material.dart';
import 'package:intweet_aplikation/pages/chat_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ChatOverview(),
    );
  }
}
