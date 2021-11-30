import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final String launchedate;
  final String launchsite;
  final String popularity;

  ProductModel({
    required this.id,
    required this.name,
    required this.launchedate,
    required this.launchsite,
    required this.popularity,
  });
}
