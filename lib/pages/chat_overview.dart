import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intweet_aplikation/components/top_bar.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
    );
  }
}
