import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CartPageHeader extends StatelessWidget {
  const CartPageHeader({
    super.key,
    required this.utils,
    required this.theme,
  });

  final ResponsiveUtils utils;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: utils.getResponsiveHeight(context, 127),
      child: Padding(
        padding: utils.getResponsivePadding(context, top: 71, start: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyBackButton(),
            Padding(
              padding: utils.getResponsivePadding(
                context,
                start: 100,
              ),
              child: Text(
                Strings.cart,
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
