import 'package:flutter/material.dart';

import '../theme_management/extensions/my_card_theme/my_card_theme.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    MyCardTheme cardTheme =
        Theme.of(context).extensions[MyCardTheme] as MyCardTheme;

    return Card(
      color: cardTheme.cardColor,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
