import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatefulWidget {
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String tag;
  final IconData? prefixIcon;
  final bool password;

  const CustomInput(
      {Key? key,
      this.prefixIcon,
      this.password = false,
      this.tag = "",
      this.alignment = Alignment.centerLeft,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      margin: widget.margin,
      child: TextField(
        obscureText: widget.password,
        style: const TextStyle(color: Color(0xffD5FAFF), fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: widget.password
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffD5FAFF),
                    size: 24,
                  ))
              : null,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: const Color(0xffD5FAFF),
            size: 26,
          ),
          filled: true,
          fillColor: const Color(0xff454D4D),
          hintText: widget.tag,
          hintStyle: const TextStyle(color: Color(0xffD5FAFF), fontSize: 16),
          contentPadding: const EdgeInsets.only(left: 16, top: 0, bottom: -1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
