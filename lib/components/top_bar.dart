import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:intweet_aplikation/service/auth_service.dart';

class TopBar extends StatelessWidget implements PreferredSize {
  final bool _actions;
  final String _title;
  final IconButton? _leading;

  const TopBar(
      {required Key key,
      bool actions = true,
      String title = "",
      IconButton? leading})
      : _actions = actions,
        _title = title,
        _leading = leading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return AppBar(
        leading: _leading,
        elevation: 0,
        backgroundColor: const Color(0xff2C3333),
        title: _title != ""
            ? Text(_title,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffD6DFDE)))
            : null,
        actions: _actions
            ? [
                Container(
                  padding: const EdgeInsets.only(right: 8, bottom: 0, top: 0),
                  child: IconButton(
                      onPressed: () {
                        authService.signOut();
                        Navigator.popAndPushNamed(context, "/login");
                      },
                      icon: const Icon(
                        Icons.power_settings_new,
                        color: Color(0xffD6DFDE),
                        size: 30,
                      )),
                )
              ]
            : []);
  }

// TODO mach die TopBar neu, die ist schmutz.

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();
}
