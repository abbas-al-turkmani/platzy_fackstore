import 'package:flutter/material.dart';

class TextStyleParameters {
  BuildContext context;
  double size;
  double? height;
  double? thickness;
  Color color;
  TextDecoration decoration;
  FontStyle style;
  TextStyleParameters(
    this.context,
    this.size, {
    this.height,
    this.thickness,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
    this.style = FontStyle.normal,
  });
}
