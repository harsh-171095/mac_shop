import 'package:flutter/material.dart';
import './product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _items = [];

  List<ProductModel> get items {
    return [..._items];
  }

  void addProduct(ProductModel value) {
    _items.add(value);
    notifyListeners();
  }
}
