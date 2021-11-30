import 'package:flutter/material.dart';

TextStyle getTextStyle(AppTextStyle style) {
  switch (style) {
    case AppTextStyle.header:
      return const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontStyle: FontStyle.normal,
      );
    case AppTextStyle.titleWithWhiteColor:
      return const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontStyle: FontStyle.normal,
      );
    case AppTextStyle.boldWithWhiteColor:
      return const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold);
    case AppTextStyle.titleWithBlackColor:
      return const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700);
    case AppTextStyle.boldWithBlackColor:
      return const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold);
    case AppTextStyle.subtitleWithBlack:
      return const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontStyle: FontStyle.normal,
      );
  }
}

enum AppTextStyle {
  header,
  titleWithWhiteColor,
  boldWithWhiteColor,
  titleWithBlackColor,
  boldWithBlackColor,
  subtitleWithBlack
}
