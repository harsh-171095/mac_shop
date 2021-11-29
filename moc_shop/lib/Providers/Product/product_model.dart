import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  String imageUrl = "";

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}
