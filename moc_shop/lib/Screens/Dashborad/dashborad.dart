import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';
import 'package:moc_shop/Screens/Dashborad/list_dashborad.dart';

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
            child: _isGrid ? const ListDashborad() : const GridDashborad(),
          ),
        ));
  }

  Widget _ViewStyle() {
    return InkWell(
      child: Icon(_isGrid ? Icons.grid_view_rounded : Icons.list_rounded),
      onTap: () {
        setState(() {
          _isGrid = !_isGrid;
        });
      },
    );
  }
}
