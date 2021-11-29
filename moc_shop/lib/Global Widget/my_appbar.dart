import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar(String title, {List<Widget> right = const []}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: right,
        ),
      )
    ],
  );
}
