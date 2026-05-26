import 'package:easy_localization/easy_localization.dart';
import 'package:platzy_fackstore/core/app_cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_cubit/app_cubit.dart';
import 'core/dependency_injection/service_locator.dart';
import 'core/router.dart';
import 'core/theme_management/dark_theme.dart';
import 'core/theme_management/white_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(
        authDatasource: getItInstance(),
        preferences: getItInstance(),
        usersDatasource: getItInstance(),
      )..initApp(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) => ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: WhiteTheme.themeData(context),
              darkTheme: DarkTheme.themeData(context),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Ecommerce app by Abbas',
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
