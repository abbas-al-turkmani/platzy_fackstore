import 'package:platzy_fackstore/features/auth/models/user_info.module.dart';
import 'package:platzy_fackstore/features/auth/models/user_register.module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initState());

  void registerUser(UserRegisterModel model) {}

  void insertUserInfo(UserInfoModel userInfo) {}
}
