import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/home_cubit.bloc.dart';
import '../../bloc/state/home.state.dart';
import '../section_header.dart';
import 'product_card.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit pageCubit = context.read();

    return SizedBox(
      height: 400,
      child: Column(
        children: [
          SectionHeader(
            seeAllOnPressed: () => router.push(
              Routes.categoryPage,
              extra: {
                ConstantKeys.homeCubit: context.read<HomeCubit>(),
              },
            ),
            sectionName: Strings.topSelling,
          ),
          SizedBox(
            height: 280,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.productsSubstate.isLoading !=
                  current.productsSubstate.isLoading,
              builder: (context, state) {
                return LoadingWidget(
                  isLoading: state.productsSubstate.isLoading,
                  errorMessage: state.productsSubstate.error,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.productsSubstate.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        favoriteOnPressed: pageCubit.toggleProductFavorite,
                        model: state.productsSubstate.list[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
