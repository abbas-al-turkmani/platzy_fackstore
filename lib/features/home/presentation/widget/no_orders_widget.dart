import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/home_cubit.bloc.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({
    super.key,
    required this.utils,
    required this.theme,
  });

  final ResponsiveUtils utils;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.pngs.checkOut
              .image(width: utils.getResponsiveWidth(context, 100)),
          const SizedBox(
            height: 20,
          ),
          Text(
            Strings.noOrdersYet,
            style: theme.primaryTextTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton2(
            height: 52,
            text: Strings.explorCatigories,
            onPressed: () => router.push(
              Routes.categoriesPage,
              extra: {
                ConstantKeys.homeCubit: context.read<HomeCubit>(),
              },
            ),
          )
        ],
      ),
    );
  }
}
