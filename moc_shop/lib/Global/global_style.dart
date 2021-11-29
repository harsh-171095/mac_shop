import 'package:flutter/material.dart';

TextStyle getTextStyle(AppTextStyle style) {
  switch (style) {
    case AppTextStyle.header:
      return const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontStyle: FontStyle.normal,
      );
    case AppTextStyle.productNameG:
      return const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontStyle: FontStyle.normal,
      );
    case AppTextStyle.productPriceG:
      return const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold);
    case AppTextStyle.productNameL:
      return const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700);
    case AppTextStyle.productPriceL:
      return const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold);
  }
}

enum AppTextStyle {
  header,
  productNameG,
  productPriceG,
  productNameL,
  productPriceL,
}
