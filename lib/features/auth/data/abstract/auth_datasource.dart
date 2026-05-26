import 'package:dartz/dartz.dart';

import '../../../../core/network/failuer.dart';
import '../models/user_profile.module.dart';
import '../models/user_tokens.module.dart';
import '../models/user_login.module.dart';

abstract class AuthDatasource {
  Future<Either<Failuer, UserTokens>> login(UserLoginModel userModel);
  Future<Either<Failuer, UserProfile>> getProfile(String accessToken);
}
