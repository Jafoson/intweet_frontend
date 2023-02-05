import 'package:flutter/material.dart';
import 'package:intweet_aplikation/components/costum_searchbar.dart';
import 'package:intweet_aplikation/components/top_bar.dart';

import '../components/OverviewContainer.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C3333),
        appBar: const TopBar(),
        body: Container(
          child: Column(children: [
            const CostumSearch(),
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
