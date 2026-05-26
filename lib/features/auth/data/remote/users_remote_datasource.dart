import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';
import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';
import 'package:platzy_fackstore/features/auth/data/abstract/users_datasource.dart';
import 'package:platzy_fackstore/features/auth/data/models/new_user.module.dart';
import 'package:platzy_fackstore/features/auth/data/models/user_profile.module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UsersRemoteDatasource extends UsersDatasource {
  final AppDio appDio;
  final GeneralApi generalApi;

  UsersRemoteDatasource({
    required this.appDio,
    required this.generalApi,
  });

  @override
  Future<Either<Failuer, List<UserProfile>>> getData() async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
      ApiRequest(url: dotenv.env[ConstantKeys.usersApi]!),
    ))
        .map(
      (r) => List.generate(
        (r.body as List).length,
        (index) => UserProfile.fromMap((r.body as List)[index]),
      ),
    );
  }

  @override
  Future<Either<Failuer, UserProfile>> getDataById(int id) async {
    appDio.setJsonHeaders();

    return (await generalApi.get(
      ApiRequest(url: '${dotenv.env[ConstantKeys.usersApi]!}/$id'),
    ))
        .map(
      (r) => UserProfile.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, bool>> isValid(String email) async {
    appDio.setJsonHeaders();

    return (await generalApi.post(
      ApiRequest(
        url: dotenv.env[ConstantKeys.userIsValidApi]!,
        body: {ConstantKeys.email: email},
      ),
    ))
        .map(
      (r) => (r.body as Map)[ConstantKeys.isValid],
    );
  }

  @override
  Future<Either<Failuer, UserProfile>> postData(NewUser model) async {
    appDio.setJsonHeaders();

    return (await generalApi.post(
      ApiRequest(
        url: '${dotenv.env[ConstantKeys.usersApi]!}/$id',
        body: model.toMap(),
      ),
    ))
        .map(
      (r) => UserProfile.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<Either<Failuer, UserProfile>> putData(UserProfile model) async {
    appDio.setJsonHeaders();

    return (await generalApi.put(
      ApiRequest(
        url: '${dotenv.env[ConstantKeys.usersApi]!}/$id',
        body: model.toMap(),
      ),
    ))
        .map(
      (r) => UserProfile.fromMap(
        r.body as Map<String, dynamic>,
      ),
    );
  }
}
