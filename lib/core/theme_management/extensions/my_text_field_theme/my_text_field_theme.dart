import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_text_field_theme.tailor.dart';

@TailorMixin()
class MyTextFieldTheme extends ThemeExtension<MyTextFieldTheme>
    with _$MyTextFieldThemeTailorMixin {
  @override
  final Color fillColor;
  @override
  final Color textColor;
  @override
  final Color hintColor;

  MyTextFieldTheme({
    required this.fillColor,
    required this.textColor,
    required this.hintColor,
  });
}
