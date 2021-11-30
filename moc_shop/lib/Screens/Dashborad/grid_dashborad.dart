import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:moc_shop/Providers/Product/product_provider.dart';
import 'package:moc_shop/Screens/AddProduct/add_product.dart';
import 'package:moc_shop/Utils/routs.dart';
import 'package:provider/provider.dart';
import './product_grid_cell.dart';

class GridDashborad extends StatelessWidget {
  final List<ProductModel> array;
  const GridDashborad({Key? key, required this.array}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _Ratio = 1;
    int _AxisCount = 2;
    if (kIsWeb) {
      _Ratio = 1;
      _AxisCount = 8;
    }

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _AxisCount,
          childAspectRatio: _Ratio,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: array.length,
        itemBuilder: (ctx, i) => ProductGridCell(array[i], onTap: () {
              print('didSelected grid cell with index:$i');
              AppRoutes.push(
                  context,
                  AddProduct(
                    screenType: AddProductScreenType.edit,
                    id: array[i].id,
                  ));
            }, onRemove: (id) {
              showAlert(context, id);
            }));
  }

  void showAlert(BuildContext ctx, String id) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: MyLabel("Delete Product", AppTextStyle.boldWithBlackColor),
            content: MyLabel("Are you soure you want to delete this product?",
                AppTextStyle.subtitleWithBlack),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .deleteProduct(id);
                  Navigator.of(context).pop();
                },
                child: MyLabel("Delete", AppTextStyle.boldWithBlackColor),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: MyLabel("Cancel", AppTextStyle.boldWithBlackColor),
              ),
            ],
          );
        });
  }
}
