import 'package:easy_localization/easy_localization.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/button2_theme/button2_theme.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/home_cubit.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:platzy_fackstore/core/theme_management/extensions/my_card_theme/my_card_theme.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MyCardTheme cardTheme = Theme.of(context).extension()!;
    Button2Theme button2theme = Theme.of(context).extension()!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            child: Image.asset(Assets.images.profile.path),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(cardTheme.cardColor),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Men'.tr(),
                  style:
                      TextStyle(color: theme.primaryTextTheme.bodyLarge!.color),
                ),
                Icon(
                  Iconsax.arrow_down_1,
                  color: theme.iconTheme.color,
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: button2theme.backgroundColor,
            child: IconButton(
              onPressed: () => router.push(
                Routes.cartPage,
                extra: {ConstantKeys.homeCubit: context.read<HomeCubit>()},
              ),
              icon: Icon(
                Iconsax.bag_2,
                size: 16,
                color: button2theme.iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
