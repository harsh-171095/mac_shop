import 'package:flutter/material.dart';
import './product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
        id: '1', title: "My Tisets", description: "My Tisets", price: 12)
  ];

  List<ProductModel> get items {
    return [..._items];
  }

  void addProduct(ProductModel value) {
    _items.add(value);
    notifyListeners();
  }
}
