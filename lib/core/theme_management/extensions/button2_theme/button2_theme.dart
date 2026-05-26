import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'button2_theme.tailor.dart';

@TailorMixin()
class Button2Theme extends ThemeExtension<Button2Theme>
    with _$Button2ThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color textColor;
  @override
  final Color iconColor;

  Button2Theme({
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
  });
}
