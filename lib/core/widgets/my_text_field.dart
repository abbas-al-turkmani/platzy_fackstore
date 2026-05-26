import 'package:flutter/material.dart';

import '../theme_management/extensions/my_text_field_theme/my_text_field_theme.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
  });

  final String hintText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    MyTextFieldTheme theme =
        Theme.of(context).extensions[MyTextFieldTheme] as MyTextFieldTheme;

    return TextField(
      controller: controller,
      style: TextStyle(color: theme.textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: theme.hintColor),
        filled: true,
        fillColor: theme.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
