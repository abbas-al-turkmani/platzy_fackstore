import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:platzy_fackstore/core/app_cubit/app_cubit.dart';
import 'package:platzy_fackstore/core/app_cubit/app_state.dart';
import 'package:platzy_fackstore/core/constants/routes.dart';
import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/gen/colors.gen.dart';
import 'package:platzy_fackstore/core/router.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';
import 'package:platzy_fackstore/gen/assets.gen.dart';

class LoadingAppPage extends StatelessWidget {
  const LoadingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils utils = getItInstance();
    return Scaffold(
      body: ColoredBox(
        color: ColorName.buttonColor2,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Assets.images.logo.image(
                width: utils.getResponsiveWidth(context, 175),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return state.loginSubstate.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : InkWell(
                            onTap: () => router.go(Routes.logInPage),
                            child: Text(Strings.sContinue,
                                style: Theme.of(context)
                                    .textButtonTheme
                                    .style!
                                    .textStyle!
                                    .resolve({})),
                          );
                  },
                ),
                SizedBox(
                  height: utils.getResponsiveHeight(context, 39),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
