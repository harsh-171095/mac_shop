import 'package:flutter/material.dart';

class GridDashborad extends StatelessWidget {
  const GridDashborad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 7,
        itemBuilder: (ctx, i) => Container(
              color: Colors.amber,
            ));
  }
}
