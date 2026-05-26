import 'package:dartz/dartz.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/core/network/api_request.dart';
import 'package:platzy_fackstore/core/network/app_dio.dart';

import 'package:platzy_fackstore/core/network/failuer.dart';
import 'package:platzy_fackstore/core/network/general_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/notification.module.dart';
import '../abstract/notifications_datasource.dart';

class NotificationsRemoteDatasource extends NotificationsDatasource {
  final GeneralApi generalApi;
  final AppDio appDio;

  NotificationsRemoteDatasource({
    required this.generalApi,
    required this.appDio,
  });

  @override
  Future<Either<Failuer, List<NotificationModel>>> getData() async {
    appDio.setJsonHeaders();

    return (await generalApi
            .get(ApiRequest(url: dotenv.env[ConstantKeys.notificationsApi]!)))
        .map(
      (r) => List.generate(
        (r.body as List).length,
        (index) => NotificationModel.fromJson(
          (r.body as List)[index],
        ),
      ),
    );
  }

  @override
  Future<Either<Failuer, NotificationModel>> getDataById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, NotificationModel>> postData(Null model) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, NotificationModel>> putData(NotificationModel model) {
    throw UnimplementedError();
  }
}
