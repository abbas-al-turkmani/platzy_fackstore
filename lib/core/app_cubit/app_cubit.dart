import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:platzy_fackstore/features/auth/data/abstract/users_datasource.dart';
import 'package:platzy_fackstore/features/auth/data/models/user_login.module.dart';

import '../../features/auth/data/abstract/auth_datasource.dart';
import '../constants/keys.dart';
import '../constants/routes.dart';
import '../router.dart';
import '../sub_states/login_substate.dart';
import '../sub_states/substate.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required this.authDatasource,
    required this.usersDatasource,
    required this.preferences,
  }) : super(AppState.initState());

  final AuthDatasource authDatasource;
  final UsersDatasource usersDatasource;

  final SharedPreferences preferences;

  Future<void> initApp() async {
    String? acessToken = preferences.getString(ConstantKeys.accessToken);
    ThemeMode? themeMode;

    switch (preferences.getString(ConstantKeys.themeMode)) {
      case 'system':
        themeMode = ThemeMode.system;
        break;
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }

    if (acessToken != null) {
      return emit(
        state.copyWith(
          loginSubstate: state.loginSubstate.handleEither(
            await authDatasource.getProfile(acessToken),
            onRight: (userModel) => router.go(Routes.homePage),
          ),
          themeMode: themeMode,
        ),
      );
    }

    emit(state.copyWith(
      loginSubstate: state.loginSubstate.stopLoading(),
      themeMode: themeMode,
    ));
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
    preferences.setString(ConstantKeys.themeMode, themeMode.name);
  }

  // ignore: unused_element
  void _goToLogin() => router.go(Routes.logInPage, extra: {
        ConstantKeys.email: preferences.getString(ConstantKeys.email),
        ConstantKeys.password: preferences.getString(ConstantKeys.password),
      });

  Future<void> tryEmail(String email) async {
    emit(state.copyWith(
      checkEmailSubstate: state.checkEmailSubstate.runLoading(),
    ));

    int newLoginIndex = 0;
    Substate<bool> newSubstate = state.checkEmailSubstate.handleEither(
        await usersDatasource.isValid(email),
        onRight: (value) => newLoginIndex = 1,
        onLeft: () => {});

    emit(state.copyWith(
      checkEmailSubstate: newSubstate,
      loginPageIndex: newLoginIndex,
    ));

    // -- TODO show snakbar with error message: time out, connection error ...etc.
    // -- TODO show snakbar with message: email not found!
  }

  Future<void> login(UserLoginModel loginModel) async {
    emit(state.copyWith(
      loginSubstate: state.loginSubstate.runLoading(),
    ));

    (await authDatasource.login(loginModel)).fold(
      (l) => emit(state.copyWith(
        loginSubstate: LoginSubstate(
          error: l,
          isAuthorized: false,
          isLoading: false,
        ),
      )),
      // -- TODO show snakbar with error message.
      (r) async {
        emit(state.copyWith(
          loginSubstate: state.loginSubstate.handleEither(
            await authDatasource.getProfile(r.accessToken),
          ),
        ));

        preferences.setString(ConstantKeys.accessToken, r.accessToken);
        preferences.setString(ConstantKeys.refreshToken, r.refreshToken);
      },
    );
  }
}
