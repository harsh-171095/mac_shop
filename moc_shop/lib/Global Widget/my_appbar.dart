import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    ),
  );
}
