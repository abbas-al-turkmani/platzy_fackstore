import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/widgets/my_button_2.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/state/home.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/home_cubit.bloc.dart';

import 'widgets/cart_page_header.dart';
import 'widgets/cart_pill.dart';
import 'widgets/empty_cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                utils.getResponsiveSymmetricPadding(context, horizontal: 24),
            child: BlocProvider.value(
              value: homeCubit,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.cartSubstate.isLoading ||
                          state.productsSubstate.isLoading
                      ? const CircularProgressIndicator()
                      : state.cartSubstate.list.isEmpty
                          ? EmptyCartWidget(
                              utils: utils,
                              theme: theme,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CartPageHeader(
                                  utils: utils,
                                  theme: theme,
                                ),
                                Expanded(
                                  child: CartPill(utils: utils, theme: theme),
                                ),
                                Padding(
                                  padding: utils.getResponsiveSymmetricPadding(
                                    context,
                                    horizontal: 24,
                                    vertical: 14,
                                  ),
                                  child: MyButton2(
                                    text: Strings.checkout,
                                    height: 52,
                                    onPressed: () =>
                                        router.push(Routes.orderPlacedPage),
                                  ),
                                ),
                              ],
                            );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
