import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class TopBar extends StatelessWidget implements PreferredSize {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xff2C3333),
      title: const Text("Chats",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xffD6DFDE))),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Iconify(
              Zondicons.user_solid_circle,
              color: Color(0xffD6DFDE),
              size: 30,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
