import 'package:easy_localization/easy_localization.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/any_page_theme/any_page_theme.dart';
import 'package:platzy_fackstore/core/widgets/back_button.dart';
import 'package:platzy_fackstore/features/home/presentation/bloc/state/home.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/products/product_card.dart';
import '../bloc/home_cubit.bloc.dart';
import '../../models/category.module.dart';
import '../../models/product.module.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage(
      {super.key, this.category, required this.homeCubit});

  final HomeCubit homeCubit;
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    AnyPageTheme pageTheme =
        Theme.of(context).extensions[AnyPageTheme] as AnyPageTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: pageTheme.background,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider.value(
            value: homeCubit,
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              List<ProductModel> products = category == null
                  ? state.productsSubstate.list
                  : List.from(
                      state.productsSubstate.list.where(
                        (element) => element.category.id == category!.id,
                      ),
                    );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // back button
                  const Expanded(
                    flex: 1,
                    child: MyBackButton(),
                  ),

                  // catigory name
                  category == null
                      ? const Expanded(
                          flex: 1,
                          child: Text(
                            'All Products',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: Text(
                            '${category!.name} (${products.length})',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                  // products
                  Expanded(
                    flex: 13,
                    child: products.isEmpty
                        ? Center(
                            child: Text(
                              'Nothing To be Shown!'.tr(),
                              style: const TextStyle(color: Colors.white),
                            ),
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
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                  favoriteOnPressed: context
                                      .read<HomeCubit>()
                                      .toggleProductFavorite,
                                  model: products[index]);
                            },
                          ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
