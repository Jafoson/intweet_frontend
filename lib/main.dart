import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intweet_aplikation/helper/helper_function.dart';
import 'package:intweet_aplikation/pages/chat.dart';
import 'package:intweet_aplikation/pages/chat_overview.dart';
import 'package:intweet_aplikation/pages/creation.dart';
import 'package:intweet_aplikation/pages/login.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then(((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    }));
  }

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
      home: _isSignedIn ? const ChatOverview() : const Login(),
    );
  }
}
