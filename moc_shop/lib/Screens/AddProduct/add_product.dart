import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Global%20Widget/my_text_filed.dart';
import 'package:moc_shop/Global/validation.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';
import 'package:moc_shop/Providers/Product/product_provider.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  bool enableAutoValidate = false;
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _launchedAtController = TextEditingController();
  TextEditingController _launchSiteController = TextEditingController();
  var rating = 1.0;
  var ratingCount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar('Add Product'),
      body: Stack(children: [
        Form(
          key: _formKey,
          autovalidateMode: enableAutoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: _productNameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (!Validation.isRequired(value!, allowEmptySpaces: true)) {
                    return 'Product Name required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _launchedAtController,
                textInputAction: TextInputAction.next,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'LaunchedAt',
                ),
                validator: (value) {
                  if (!Validation.isRequired(value!, allowEmptySpaces: true)) {
                    return 'LaunchedAt required';
                  }
                  return null;
                },
                onTap: () {
                  _showDatePicker();
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _launchSiteController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Launch Site',
                ),
                validator: (value) {
                  if (!Validation.isRequired(value!, allowEmptySpaces: true)) {
                    return 'Launch Site required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {
                    ratingCount = v;
                  },
                  starCount: 5,
                  rating: rating,
                  size: 40.0,
                  isReadOnly: false,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                  spacing: 0.0),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    enableAutoValidate = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    DateTime _now = DateTime.now();

                    ProductModel product  = ProductModel(
                        id: _now.toString(),
                        name: _productNameController.text,
                        launchedate: _launchedAtController.text,
                        launchsite: _launchSiteController.text,
                        popularity: ratingCount.toString());

                    Provider.of<ProductProvider>(context,listen: false).addProduct(product);

                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ]),
    );
  }

  _showDatePicker() async {
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2100));
    int dd = picker!.day;
    String ddd;
    if (dd < 9) {
      ddd = '0' + dd.toString();
    } else {
      ddd = dd.toString();
    }

    int mm = picker.month;
    String mmm;
    if (mm < 9) {
      mmm = '0' + mm.toString();
    } else {
      mmm = mm.toString();
    }

    int yy = picker.year;
    setState(() {
      _launchedAtController.text = '$ddd-$mmm-$yy';
    });
  }

  void _onSubmitted() {

  }
}
