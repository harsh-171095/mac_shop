import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moc_shop/Global%20Widget/my_appbar.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global%20Widget/my_text_filed.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Global/validation.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';
import 'package:moc_shop/Providers/Product/product_provider.dart';
import 'package:moc_shop/Screens/Dashborad/grid_dashborad.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

enum AddProductScreenType { add, edit }

class AddProduct extends StatefulWidget {
  final AddProductScreenType screenType;
  final String id;
  AddProduct(
      {Key? key, this.screenType = AddProductScreenType.add, this.id = ''})
      : super(key: key);
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProduct> {
  ProductModel? editData;
  final _formKey = GlobalKey<FormState>();
  bool enableAutoValidate = false;
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _launchedAtController = TextEditingController();
  TextEditingController _launchSiteController = TextEditingController();
  var rating = 1.0;
  var ratingCount = 1.0;

  @override
  void initState() {
    super.initState();
    bool isEdit = widget.screenType == AddProductScreenType.edit;
    if (isEdit) {
      setState(() {
        var editDataObj = Provider.of<ProductProvider>(context, listen: false)
            .getProductFromID(widget.id);
        _productNameController.text = editDataObj.name;
        _launchedAtController.text = editDataObj.launchedate;
        _launchSiteController.text = editDataObj.launchsite;
        rating = double.parse(editDataObj.popularity);
        ratingCount = double.parse(editDataObj.popularity);
        editData = editDataObj;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.screenType == AddProductScreenType.edit;
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(isEdit ? 'Edit Product' : 'Add Product'),
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
                    print('onRated : $v');
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
                    var providerObj =
                        Provider.of<ProductProvider>(context, listen: false);

                    ProductModel product = ProductModel(
                        id: isEdit
                            ? editData?.id ?? ""
                            : DateTime.now().millisecondsSinceEpoch.toString(),
                        name: _productNameController.text,
                        launchedate: _launchedAtController.text,
                        launchsite: _launchSiteController.text,
                        popularity: ratingCount.toString());

                    if (providerObj.isProductFound(product.name,
                            id: editData?.id ?? "") ==
                        false) {
                      if (isEdit) {
                        providerObj.editProduct(product);
                      } else {
                        providerObj.addProduct(product);
                      }
                      Navigator.of(context).pop();
                    } else {
                      showAlert(context);
                    }
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
    print('show picker');
    DateTime initialDate = DateTime.now();
    if (widget.screenType == AddProductScreenType.edit) {
      print(_launchedAtController.text);
      var newdate = DateFormat('dd-MM-yyyy').parse(_launchedAtController.text);
      print(newdate);
      initialDate = newdate;
    }

    var picker = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2100));
    print('selected new date');
    print(picker);
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
    print('$ddd-$mmm-$yy');
    setState(() {
      _launchedAtController.text = '$ddd-$mmm-$yy';
    });
  }

  void showAlert(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: MyLabel("Validation", AppTextStyle.boldWithBlackColor),
            content: MyLabel(
                "This product is already added. Please try with other name.",
                AppTextStyle.subtitleWithBlack,
                maxLine: 3),
            actions: <Widget>[
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
