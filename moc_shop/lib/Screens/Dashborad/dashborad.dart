import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';

class Dashborad extends StatelessWidget {
  static const routeName = "/";

  Dashborad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dashborad'),
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
