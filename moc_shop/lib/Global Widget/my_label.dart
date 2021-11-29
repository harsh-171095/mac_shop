import 'package:flutter/material.dart';
import 'package:moc_shop/Global/global_style.dart';

// ignore: non_constant_identifier_names
Text MyLabel(String title, AppTextStyle style, {int maxLine = 1}) {
  return Text(
    title,
    style: getTextStyle(style),
    maxLines: maxLine,
  );
}
