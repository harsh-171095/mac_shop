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
      onTap: onTap(),
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
                      child: Image.network(
                          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT_Va2UUB2ASvvqInJtLw9UEplaa9rToSfGe3SFv2GmDb5TKahjn2TWxJeLOTRQC52BK7846RlWlw'),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyLabel(dataObj.name, AppTextStyle.productNameL),
                          const SizedBox(
                            height: 5,
                          ),
                          MyLabel("15 Jan 2021", AppTextStyle.productNameL),
                          const SizedBox(
                            height: 5,
                          ),
                          MyLabel("myntra.com", AppTextStyle.productPriceL),
                          const RatingWidget(rating: 2.5),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  print("cell remove");
                  onRemove(dataObj.id);
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
