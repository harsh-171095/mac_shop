import 'package:flutter/material.dart';
import 'package:moc_shop/Screens/Dashborad/dashborad.dart';
import './product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _items = [];
  DashboradShort short = DashboradShort.name;

  List<ProductModel> get items {
    switch (short) {
      case DashboradShort.name:
        _items.sort((object1, object2) {
          return object1.name
              .toLowerCase()
              .compareTo(object2.name.toLowerCase());
        });
        break;
      case DashboradShort.date:
        _items.sort((object1, object2) {
          return int.parse(object2.id).compareTo(int.parse(object1.id));
        });
        break;
      case DashboradShort.site:
        _items.sort((object1, object2) {
          return object1.launchsite
              .toLowerCase()
              .compareTo(object2.launchsite.toLowerCase());
        });
        break;
      case DashboradShort.rate:
        _items.sort((object1, object2) {
          return double.parse(object2.popularity)
              .compareTo(double.parse(object1.popularity));
        });
        break;
    }
    return [..._items];
  }

  DashboradShort get currentShort {
    return short;
  }

  ProductModel getProductFromID(String id) {
    return _items.where((element) => element.id == id).toList().first;
  }

  bool isProductFound(String name, {String id = ""}) {
    List array = _items.where((element) {
      if (id.isNotEmpty) {
        return (element.name.toLowerCase() == name.toLowerCase()) &&
            element.id != id;
      }
      return element.name.toLowerCase() == name.toLowerCase();
    }).toList();
    return array.length > 0;
  }

  void addProduct(ProductModel value) {
    _items.add(value);
    notifyListeners();
  }

  void editProduct(ProductModel value) {
    var index = _items.indexWhere((element) => element.id == value.id);
    _items[index] = value;
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void shortWith(DashboradShort short) {
    this.short = short;
    notifyListeners();
  }
}
