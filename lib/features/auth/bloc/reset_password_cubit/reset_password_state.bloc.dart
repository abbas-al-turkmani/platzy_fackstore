// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:platzy_fackstore/core/sub_states/substate.dart';

class ResetPasswordState {
  final Substate<bool> checkEmailSubstate;
  final int pageIndex;

  ResetPasswordState(
      {required this.checkEmailSubstate, required this.pageIndex});

  factory ResetPasswordState.initState() => ResetPasswordState(
      checkEmailSubstate: Substate.initState(), pageIndex: 0);

  ResetPasswordState copyWith({
    Substate<bool>? checkEmailSubstate,
    int? pageIndex,
  }) {
    return ResetPasswordState(
      checkEmailSubstate: checkEmailSubstate ?? this.checkEmailSubstate,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
