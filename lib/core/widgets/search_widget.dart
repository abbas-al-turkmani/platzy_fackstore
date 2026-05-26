import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../theme_management/extensions/my_card_theme/my_card_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyCardTheme cardTheme = Theme.of(context).extension()!;

    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Iconsax.search_normal_1,
          size: 16,
        ),
        prefixIconColor: Colors.white,
        hintText: Strings.search,
        hintStyle: TextStyle(color: cardTheme.textLarge.color),
        filled: true,
        fillColor: cardTheme.cardColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
