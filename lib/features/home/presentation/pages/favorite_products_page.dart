import 'package:easy_localization/easy_localization.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/any_page_theme/any_page_theme.dart';
import 'package:platzy_fackstore/core/widgets/back_button.dart';
import 'package:platzy_fackstore/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/products/product_card.dart';
import '../bloc/home_cubit.bloc.dart';
import '../bloc/state/home.state.dart';

class FavoriteProductsPage extends StatelessWidget {
  const FavoriteProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit pageCubit = context.read();

    Size screenSize = MediaQuery.of(context).size;

    AnyPageTheme pageTheme = Theme.of(context).extension();

    return SafeArea(
      child: Scaffold(
        backgroundColor: pageTheme.background,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const MyBackButton(),
                        const SizedBox(width: 10),
                        Text(
                          '${'My favorite Products'.tr()} (${state.favoriteProducts.length})',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Favorited items
                  Expanded(
                    flex: 12,
                    child: state.favoriteProducts.isEmpty
                        ? Center(
                            child: Text(
                              'No Favorited Items found!'.tr(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : LoadingWidget(
                            isLoading: state.productsSubstate.isLoading,
                            errorMessage: state.productsSubstate.error,
                            child: state.favoriteProducts.isEmpty
                                ? Center(
                                    child:
                                        Text('No Favorited Items found!'.tr()),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: screenSize.width < 350
                                          ? 1
                                          : screenSize.width < 500
                                              ? 2
                                              : screenSize.width < 700
                                                  ? 3
                                                  : screenSize.width < 900
                                                      ? 4
                                                      : 5,
                                    ),
                                    itemCount: state.favoriteProducts.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductCard(
                                        model: state.favoriteProducts[index],
                                        favoriteOnPressed:
                                            pageCubit.toggleProductFavorite,
                                      );
                                    },
                                  ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
