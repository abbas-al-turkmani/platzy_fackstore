import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';

import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/user_login.module.dart';
import '../models/user_profile.module.dart';
import '../models/user_tokens.module.dart';
import '../abstract/auth_datasource.dart';

class AuthRemoteDatasource extends AuthDatasource {
  final GeneralApi generalApi;
  final AppDio appDio;

  AuthRemoteDatasource({
    required this.generalApi,
    required this.appDio,
  });

  @override
  Future<Either<Failuer, UserProfile>> getProfile(String accessToken) async {
    appDio.setJsonHeaders();

    return (await generalApi
            .get(ApiRequest(url: dotenv.env[ConstantKeys.getProfileApi]!)))
        .map(
      (r) => UserProfile.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, UserTokens>> login(UserLoginModel userModel) async {
    appDio.setJsonHeaders();

    return (await generalApi
            .post(ApiRequest(url: dotenv.env[ConstantKeys.loginApi]!)))
        .map(
      (r) => UserTokens.fromMap(
        r as Map<String, dynamic>,
      ),
    );
  }
}
