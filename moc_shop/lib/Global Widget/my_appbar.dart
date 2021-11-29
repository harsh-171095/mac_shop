import 'package:flutter/material.dart';
import 'package:moc_shop/Screens/AddProduct/add_product.dart';
import 'package:moc_shop/Utils/routs.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    ),
  );
}
