import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';
import 'package:moc_shop/Screens/Dashborad/product_list_cell.dart';

class ListDashborad extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ListDashborad();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return ProductListCell(
            ProductModel(
                id: index.toString(),
                title: "My T-Shart good",
                description: "no",
                price: 15.5),
            onTap: () {},
            onRemove: (String id) {
              print('remove');
              showAlert(context, id);
            },
          );
        });
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
        }).then((value) => null);
  }
}
