import 'package:flutter/material.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';
import 'package:moc_shop/Providers/Product/product_provider.dart';
import 'package:moc_shop/Screens/Dashborad/dashborad.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: const Dashborad(),
          routes: {Dashborad.routeName: (ctx) => Dashborad()}),
    );
  }
}
