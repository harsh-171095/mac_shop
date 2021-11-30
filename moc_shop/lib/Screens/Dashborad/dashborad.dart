import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_provider.dart';
import 'package:moc_shop/Screens/AddProduct/add_product.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';
import 'package:moc_shop/Screens/Dashborad/list_dashborad.dart';
import 'package:moc_shop/Utils/routs.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Dashborad extends StatefulWidget {
  static const routeName = "/";

  Dashborad({Key? key}) : super(key: key);

  @override
  State<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dashborad', right: [_ViewStyle()]),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Consumer<ProductProvider>(builder: (context, product, ch) {
            return _isGrid
                ? ListDashborad(array: product.items)
                : GridDashborad(array: product.items);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isGrid = !_isGrid;
          });
        },
        child: Icon(_isGrid ? Icons.grid_view_rounded : Icons.list_rounded),
      ),
    );
  }

  Widget _ViewStyle() {
    return InkWell(
      child: kIsWeb
          ? InkWell(
              child: MyLabel("Add New Product", AppTextStyle.productPriceG),
            )
          : const Icon(Icons.add),
      onTap: () {
        AppRoutes.push(context, AddProduct());
      },
    );
  }
}
