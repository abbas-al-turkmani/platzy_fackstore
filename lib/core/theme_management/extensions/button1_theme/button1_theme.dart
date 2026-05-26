import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'button1_theme.tailor.dart';

@TailorMixin()
class Button1Theme extends ThemeExtension<Button1Theme>
    with _$Button1ThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color textColor;
  @override
  final Color iconColor;

  Button1Theme({
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
  });
}
