import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Screens/AddProduct/add_product.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';
import 'package:moc_shop/Utils/routs.dart';

class Dashborad extends StatelessWidget {
  static const routeName = "/";

  Dashborad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Dashboard',
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {
              AppRoutes.push(context, AddProduct());
            }),
          ],
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: GridDashborad(),
          ),
        ));
  }
}
