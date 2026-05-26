import 'package:flutter/widgets.dart';

class SocialButtonModel {
  final String text;
  final String? imagePath;
  final IconData? icon;
  final VoidCallback? onTap;

  SocialButtonModel({
    required this.text,
    this.imagePath,
    this.icon,
    this.onTap,
  });
}
