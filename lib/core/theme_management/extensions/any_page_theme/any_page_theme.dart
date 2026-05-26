import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'any_page_theme.tailor.dart';

@TailorMixin()
class AnyPageTheme extends ThemeExtension<AnyPageTheme>
    with _$AnyPageThemeTailorMixin {
  @override
  final Color background;
  @override
  final Color headerText1;
  @override
  final Color primaryText1;
  @override
  final Color secoundryText1;

  AnyPageTheme({
    required this.background,
    required this.headerText1,
    required this.primaryText1,
    required this.secoundryText1,
  });
}
