import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopBar extends StatelessWidget implements PreferredSize {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2C3333),
      title: const Text("Chats",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      actions: [IconButton(onPressed: (){

      }, icon: Icon(Icons.))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
