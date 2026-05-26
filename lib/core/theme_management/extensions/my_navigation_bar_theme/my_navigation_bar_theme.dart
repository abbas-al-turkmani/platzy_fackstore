import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_navigation_bar_theme.tailor.dart';

@TailorMixin()
class MyNavigationBarTheme extends ThemeExtension<MyNavigationBarTheme>
    with _$MyNavigationBarThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color navigationBarIcon;
  @override
  final Color navigationBarIconActive;

  MyNavigationBarTheme({
    required this.backgroundColor,
    required this.navigationBarIcon,
    required this.navigationBarIconActive,
  });
}
