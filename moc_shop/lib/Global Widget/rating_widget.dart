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
              print(index.toDouble() + 1.0);
              print(rating);
              if (rating > (index.toDouble() + 1.0)) {
                return const Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.amber,
                );
              }
              return const Icon(
                Icons.star_border,
                size: 15,
                color: Colors.amber,
              );
            }));
  }
}
