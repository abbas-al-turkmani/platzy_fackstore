// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/widgets/back_button.dart';
import 'package:platzy_fackstore/core/widgets/loading_widget.dart';
import 'package:platzy_fackstore/features/home/models/category.module.dart';

import '../bloc/home_cubit.bloc.dart';
import '../bloc/state/home.state.dart';
import '../widget/categories/category_item.dart';
import 'category_products_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Back to home button
              const Expanded(flex: 1, child: MyBackButton()),

              //Page title
              Expanded(
                flex: 1,
                child: Text(
                  'Shop by Category'.tr(),
                  style: theme.primaryTextTheme.headlineMedium,
                ),
              ),

              //Categories builder
              BlocProvider.value(
                value: homeCubit,
                child: BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    return Expanded(
                      flex: 13,
                      child: LoadingWidget(
                        isLoading: state.categoriesSubstate.isLoading,
                        errorMessage: state.categoriesSubstate.error,
                        child: ListView.builder(
                          itemCount: state.categoriesSubstate.list.length,
                          itemBuilder: (BuildContext context, int index) {
                            CategoryModel category =
                                state.categoriesSubstate.list[index];

                            return CategoryItemH(
                              category: category,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider<HomeCubit>.value(
                                    value: BlocProvider.of(context),
                                    child: CategoryProductsPage(
                                      homeCubit: homeCubit,
                                      category: category,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
