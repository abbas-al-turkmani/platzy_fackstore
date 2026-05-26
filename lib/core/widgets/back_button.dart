import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: 20,
        child: IconButtonTheme(
          data: Theme.of(context).iconButtonTheme,
          child: IconButton(
            onPressed: () => router.pop(context),
            color: Colors.white,
            iconSize: 12,
            icon: const Icon(
              IconsaxPlusBroken.arrow_left_2,
            ),
          ),
        ),
      );
}
