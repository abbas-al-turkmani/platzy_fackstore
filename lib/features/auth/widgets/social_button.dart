import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/my_card_theme/my_card_theme.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

import '../models/social_button.module.dart';

class SocialButton extends StatelessWidget {
  final SocialButtonModel model;

  const SocialButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();
    MyCardTheme cardTheme =
        Theme.of(context).extensions[MyCardTheme] as MyCardTheme;

    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: cardTheme.cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: ListTile(
            leading: model.icon != null
                ? Icon(model.icon, color: cardTheme.iconColor)
                : Padding(
                    padding: utils.getResponsivePadding(
                      context,
                      start: 8,
                    ),
                    child: Image.asset(model.imagePath!, height: 24),
                  ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              model.text,
              textAlign: TextAlign.center,
              style: cardTheme.textLarge,
            ),
          ),
        ),
      ),
    );
  }
}
