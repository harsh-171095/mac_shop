import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';

import './product_grid_cell.dart';

class GridDashborad extends StatelessWidget {
  const GridDashborad();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 5,
        itemBuilder: (ctx, i) => ProductGridCell(
                ProductModel(
                    id: i.toString(),
                    title: "My T-Shart good",
                    description: "no",
                    price: 15.5),
                onTap: () {}, onRemove: (id) {
              showAlert(context, id);
            }));
  }

  void showAlert(BuildContext ctx, String id) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: MyLabel("Delete Product", AppTextStyle.productPriceL),
            content: MyLabel("Are you soure you want to delete this product?",
                AppTextStyle.productNameL),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: MyLabel("Delete", AppTextStyle.productPriceL),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: MyLabel("Cancel", AppTextStyle.productPriceL),
              ),
            ],
          );
        });
  }
}
