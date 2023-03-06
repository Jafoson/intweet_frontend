import 'package:flutter/material.dart';
import 'package:intweet_aplikation/components/costum_searchbar.dart';
import 'package:intweet_aplikation/components/top_bar.dart';
import 'package:intweet_aplikation/pages/login.dart';
import 'package:intweet_aplikation/service/auth_service.dart';

import '../components/OverviewContainer.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
        backgroundColor: const Color(0xff2C3333),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff2C3333),
          elevation: 0,
          title: const Text(
            "Chat",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xffD6DFDE)),
          ),
          actions: [
            IconButton(
                onPressed: (() {
                  authService.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Login())));
                }),
                icon: const Icon(Icons.power_settings_new))
          ],
        ),
        // TopBar(title: "Chat", key: UniqueKey()),
        body: Container(
          child: Column(children: [
            // const CostumSearch(),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return const OverviewContainer();
              },
            ))
          ]),
        )
        // SearchBar(),
        );
  }
}
