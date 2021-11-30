import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';

class ProductGridCell extends StatelessWidget {
  final ProductModel dataObj;
  final Function onTap;
  final Function onRemove;
  // ignore: use_key_in_widget_constructors
  const ProductGridCell(this.dataObj,
      {required this.onTap, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5, top: 5),
          child: InkWell(
            onTap: () {
              // onTap();
            },
            child: Card(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset('assets/images/shopping.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyLabel(
                              dataObj.name, AppTextStyle.boldWithWhiteColor),
                          MyLabel(dataObj.launchedate,
                              AppTextStyle.titleWithWhiteColor),
                          MyLabel(dataObj.launchsite,
                              AppTextStyle.titleWithWhiteColor),
                        ],
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          MyLabel(dataObj.popularity,
                              AppTextStyle.boldWithBlackColor)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  onTap();
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  onRemove(dataObj.id);
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
