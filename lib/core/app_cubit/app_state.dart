import 'package:flutter/material.dart';

import '../sub_states/login_substate.dart';
import '../sub_states/substate.dart';

class AppState {
  final Substate<bool> checkEmailSubstate;
  final LoginSubstate loginSubstate;

  final ThemeMode themeMode;

  final int loginPageIndex;
  final int registerPageIndex;

  factory AppState.initState({
    ThemeMode? themeMode,
  }) =>
      AppState(
        checkEmailSubstate: Substate.initState(),
        loginSubstate: LoginSubstate.iniState(true, false),
        loginPageIndex: 0,
        registerPageIndex: 0,
        themeMode: themeMode ?? ThemeMode.system,
      );

  AppState({
    required this.checkEmailSubstate,
    required this.loginSubstate,
    required this.loginPageIndex,
    required this.registerPageIndex,
    required this.themeMode,
  });

  AppState copyWith({
    Substate<bool>? checkEmailSubstate,
    LoginSubstate? loginSubstate,
    ThemeMode? themeMode,
    int? loginPageIndex,
    int? registerPageIndex,
  }) {
    return AppState(
      checkEmailSubstate: checkEmailSubstate ?? this.checkEmailSubstate,
      loginSubstate: loginSubstate ?? this.loginSubstate,
      themeMode: themeMode ?? this.themeMode,
      loginPageIndex: loginPageIndex ?? this.loginPageIndex,
      registerPageIndex: registerPageIndex ?? this.registerPageIndex,
    );
  }
}
