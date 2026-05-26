import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_card_theme.tailor.dart';

@TailorMixin()
class MyCardTheme extends ThemeExtension<MyCardTheme>
    with _$MyCardThemeTailorMixin {
  @override
  final Color cardColor;
  @override
  final TextStyle textLarge;
  @override
  final TextStyle textMedium;
  @override
  final Color iconColor;

  MyCardTheme({
    required this.cardColor,
    required this.textLarge,
    required this.textMedium,
    required this.iconColor,
  });
}
