import 'package:dartz/dartz.dart';

import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/features/auth/data/models/user_profile.module.dart';

import 'substate.dart';

class LoginSubstate extends Substate<UserProfile> {
  bool isAuthorized;

  final UserProfile? userModel;

  LoginSubstate({
    required super.isLoading,
    required super.error,
    required this.isAuthorized,
    this.userModel,
  });

  factory LoginSubstate.iniState(bool isLoading, bool isAutherized) =>
      LoginSubstate(
        isLoading: isLoading,
        error: Failuer.empty(),
        isAuthorized: isAutherized,
      );

  @override
  LoginSubstate runLoading() => copyWith(
        isLoading: true,
        error: Failuer.empty(),
      );
  @override
  LoginSubstate stopLoading() => copyWith(isLoading: false);

  @override
  LoginSubstate handleEither(
    Either<Failuer, UserProfile> either, {
    void Function()? onLeft,
    void Function(UserProfile userModel)? onRight,
  }) =>
      either.fold(
        (l) {
          (onLeft ?? () {}).call();
          return LoginSubstate(
            isLoading: false,
            error: l,
            isAuthorized: false,
          );
        },
        (r) {
          (onRight ?? () {}).call();
          return LoginSubstate(
            isLoading: false,
            error: Failuer.empty(),
            isAuthorized: true,
            userModel: r,
          );
        },
      );

  @override
  LoginSubstate copyWith({
    bool? isAuthorized,
    UserProfile? userModel,
    Failuer? error,
    bool? isLoading,
  }) {
    return LoginSubstate(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      userModel: userModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
