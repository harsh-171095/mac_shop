import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({Key? key, this.rating = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        alignment: Alignment.topLeft,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (ctx, index) {
              if (rating > (index.toDouble() + 1.0)) {
                print(index.toDouble());
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                );
              } else if (rating > (index + 1) && rating < (index + 1)) {
                print(index.toDouble());
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.star_half,
                    size: 15,
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.star_border,
                    size: 15,
                  ),
                );
              }
            }));
  }
}
