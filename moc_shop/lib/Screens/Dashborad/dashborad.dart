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

enum DashboradShort { name, date, site, rate }

class _DashboradState extends State<Dashborad> {
  bool _isGrid = true;
  DashboradShort _shortedBy = DashboradShort.name;

  @override
  Widget build(BuildContext context) {
    _shortedBy = Provider.of<ProductProvider>(context).currentShort;
    String _shortName = getShortName(_shortedBy);

    return Scaffold(
      appBar: MyAppBar('Dashborad', right: [_ViewStyle()]),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 30,
                width: double.infinity,
                alignment: Alignment.centerRight,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyLabel('Short by :', AppTextStyle.boldWithBlackColor),
                    showManu()
                  ],
                ),
              ),
              Expanded(
                child:
                    Consumer<ProductProvider>(builder: (context, product, ch) {
                  return _isGrid
                      ? ListDashborad(array: product.items)
                      : GridDashborad(array: product.items);
                }),
              ),
            ],
          ),
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

  String getShortName(DashboradShort short) {
    switch (short) {
      case DashboradShort.name:
        return " Name";
      case DashboradShort.date:
        return " Date";
      case DashboradShort.site:
        return " Site";
      case DashboradShort.rate:
        return " Rate";
    }
  }

  Widget _ViewStyle() {
    return InkWell(
      child: kIsWeb
          ? InkWell(
              child:
                  MyLabel("Add New Product", AppTextStyle.boldWithWhiteColor),
            )
          : const Icon(Icons.add),
      onTap: () {
        AppRoutes.push(context, AddProduct());
      },
    );
  }

  Widget showManu() {
    const double item_height = 25;

    return PopupMenuButton<String>(
      offset: Offset(0, 30),
      onSelected: (String result) {
        setState(() {
          print(result);
          switch (result) {
            case " Name":
              _shortedBy = DashboradShort.name;

              break;
            case " Date":
              _shortedBy = DashboradShort.date;
              break;
            case " Site":
              _shortedBy = DashboradShort.site;
              break;
            case " Rate":
              _shortedBy = DashboradShort.rate;
              break;
          }
          Provider.of<ProductProvider>(context, listen: false)
              .shortWith(_shortedBy);
        });
      },
      child: MyLabel(getShortName(_shortedBy), AppTextStyle.subtitleWithBlack),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          height: item_height,
          value: getShortName(DashboradShort.name),
          child: MyLabel(getShortName(DashboradShort.name),
              AppTextStyle.subtitleWithBlack),
        ),
        PopupMenuItem<String>(
          height: item_height,
          value: getShortName(DashboradShort.date),
          child: MyLabel(getShortName(DashboradShort.date),
              AppTextStyle.subtitleWithBlack),
        ),
        PopupMenuItem<String>(
          height: item_height,
          value: getShortName(DashboradShort.site),
          child: MyLabel(getShortName(DashboradShort.site),
              AppTextStyle.subtitleWithBlack),
        ),
        PopupMenuItem<String>(
          height: item_height,
          value: getShortName(DashboradShort.rate),
          child: MyLabel(getShortName(DashboradShort.rate),
              AppTextStyle.subtitleWithBlack),
        )
      ],
    );
  }
}
