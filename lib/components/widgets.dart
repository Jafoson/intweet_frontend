import 'package:flutter/material.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: (() {}),
      textColor: Colors.white,
    ),
  ));
}
