import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CostumSearch extends StatefulWidget {
  const CostumSearch({super.key});

  @override
  State<CostumSearch> createState() => _CostumSearchState();
}

class _CostumSearchState extends State<CostumSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      // color: const Color.fromARGB(243, 255, 0, 0),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff454D4D),
            contentPadding: EdgeInsets.all(0),
            suffixIcon: Icon(Icons.abc),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
