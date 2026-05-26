import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/core/widgets/my_card.dart';
import 'package:platzy_fackstore/core/widgets/my_list_builder.dart';
import 'package:platzy_fackstore/features/home/models/cart_item.module.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/home_cubit.bloc.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/state/home.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'cart_item_card.dart';

class CartPill extends StatelessWidget {
  const CartPill({
    super.key,
    required this.utils,
    required this.theme,
  });

  final ResponsiveUtils utils;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.read<HomeCubit>().clearCart(),
                    child: Text(
                      Strings.removeAll,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  MyListBuilder(
                    itemCount: state.cartSubstate.list.length,
                    initSize: 300,
                    builder: (context, index) {
                      CartItemModel model = state.cartSubstate.list[index];
                      return CartItemCard(
                        utils: utils,
                        model: model,
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.subtotal,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '00.0\$',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.shippingCost,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '00.0\$',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.tax,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '00.0\$',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.total,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '00.0\$',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  MyCard(
                    child: Padding(
                      padding: utils.getResponsivePadding(
                        context,
                        top: 16,
                        bottom: 16,
                        start: 16,
                        end: 9,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            IconsaxPlusBroken.discount_shape,
                            color: Color(0xFF5fb567),
                          ),
                          Text(
                            Strings.enterCouponCode,
                            style: theme.textTheme.titleSmall,
                          ),
                          CircleAvatar(
                            radius: 20,
                            child: IconButtonTheme(
                              data: theme.iconButtonTheme,
                              child: IconButton(
                                onPressed: () {},
                                color: Colors.white,
                                iconSize: 12,
                                icon: const Icon(
                                  IconsaxPlusBroken.arrow_right_3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
