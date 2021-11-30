import 'package:flutter/material.dart';
import 'package:moc_shop/Global%20Widget/my_label.dart';
import 'package:moc_shop/Global%20Widget/rating_widget.dart';
import 'package:moc_shop/Global/global_style.dart';
import 'package:moc_shop/Providers/Product/product_model.dart';

class ProductListCell extends StatelessWidget {
  final ProductModel dataObj;
  final Function onTap;
  final Function onRemove;
  // ignore: use_key_in_widget_constructors
  const ProductListCell(this.dataObj,
      {required this.onTap, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: Stack(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: Image.asset('assets/images/shopping.png'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyLabel(
                                dataObj.name, AppTextStyle.titleWithBlackColor),
                            const SizedBox(
                              height: 5,
                            ),
                            MyLabel(dataObj.launchedate,
                                AppTextStyle.subtitleWithBlack),
                            const SizedBox(
                              height: 5,
                            ),
                            MyLabel(dataObj.launchsite,
                                AppTextStyle.subtitleWithBlack),
                            RatingWidget(
                              rating: double.parse(dataObj.popularity),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
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
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            onRemove(dataObj.id);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: InkWell(
            //     onTap: () {
            //       print("cell remove");
            //       onRemove(dataObj.id);
            //     },
            //     child: const Icon(
            //       Icons.cancel,
            //       color: Colors.redAccent,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
