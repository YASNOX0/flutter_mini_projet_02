import 'package:flutter/material.dart';

Widget mainContainer(Widget widget) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        "Mini-Project-02",
      ),
    ),
    body: Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: widget,
    ),
  );
}
