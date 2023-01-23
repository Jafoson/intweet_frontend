import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intweet_aplikation/components/costum_searchbar.dart';
import 'package:intweet_aplikation/components/top_bar.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C3333),
        appBar: const TopBar(),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [CostumSearch()]),
        )
        // SearchBar(),
        );
  }
}
