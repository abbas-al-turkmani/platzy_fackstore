import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/abstract/users_datasource.dart';

import 'reset_password_state.bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(
    this.usersDatasource,
  ) : super(ResetPasswordState.initState());

  final UsersDatasource usersDatasource;

  Future<void> tryEmail(String email) async {
    emit(state.copyWith(pageIndex: 1));

    // emit(state.copyWith(
    //   checkEmailSubstate: state.checkEmailSubstate.runLoading(),
    // ));

    // int newPageIndex = 0;
    // Substate<bool> newSubstate = state.checkEmailSubstate.handleEither(
    //     await usersDatasource.isValid(email),
    //     onRight: (value) => newPageIndex = 1,
    //     onLeft: () => {});

    // emit(state.copyWith(
    //   checkEmailSubstate: newSubstate,
    //   pageIndex: newPageIndex,
    // ));

    // -- TODO show snakbar with error message: time out, connection error ...etc.
    // -- TODO show snakbar with message: email not found!
  }
}
