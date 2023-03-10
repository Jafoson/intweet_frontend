import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class CostumSearch extends StatefulWidget {
  final TextEditingController? controller;
  final void Function() onTap;

  const CostumSearch({Key? key, required this.controller, required this.onTap})
      : super(key: key);

  @override
  State<CostumSearch> createState() => _CostumSearchState();
}

class _CostumSearchState extends State<CostumSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 38,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              style: const TextStyle(color: Color(0xffBEE3ED), fontSize: 13),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff454D4D),
                  hintText: "Search groups...",
                  hintStyle: TextStyle(color: Color(0xffBEE3ED), fontSize: 13),
                  contentPadding: EdgeInsets.only(left: 16, top: 0, bottom: -1),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)))),
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                  color: Color(0xff4A9387),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              height: 38,
              width: 38,
              child: IconButton(
                  onPressed: widget.onTap,
                  icon: const Iconify(
                    MaterialSymbols.search,
                    color: Color(0xffD5FAFF),
                    size: 30,
                  ))),
        ],
      ),
    );
    // Container(
    //   height: 38,
    //   // color: const Color.fromARGB(243, 255, 0, 0),
    //   child: TextField(
    //     decoration: InputDecoration(
    //         filled: true,
    //         fillColor: Color(0xff454D4D),
    //         contentPadding: EdgeInsets.all(0),
    //         suffixIcon: Icon(Icons.abc),
    //         border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(15),
    //             borderSide: BorderSide.none)),
    //   ),
    // );
  }
}
