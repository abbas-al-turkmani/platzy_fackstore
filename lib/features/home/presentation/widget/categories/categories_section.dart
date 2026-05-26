import 'package:easy_localization/easy_localization.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/home_cubit.bloc.dart';
import '../../bloc/state/home.state.dart';
import '../section_header.dart';
import 'category_item.dart';

class CatigoriesSection extends StatelessWidget {
  const CatigoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SectionHeader(
              seeAllOnPressed: () => router.push(
                Routes.categoriesPage,
                extra: {
                  ConstantKeys.homeCubit: context.read<HomeCubit>(),
                },
              ),
              sectionName: 'Catigories'.tr(),
            ),
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return LoadingWidget(
                  isLoading: state.categoriesSubstate.isLoading,
                  errorMessage: state.categoriesSubstate.error,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoriesSubstate.list.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    itemBuilder: (BuildContext context, int index) =>
                        CatigoryItemV(
                      category: state.categoriesSubstate.list[index],
                      onTap: () => router.push(Routes.categoryPage, extra: {
                        ConstantKeys.homeCubit: context.read<HomeCubit>(),
                        ConstantKeys.catigory:
                            state.categoriesSubstate.list[index]
                      }),
                    ),
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
