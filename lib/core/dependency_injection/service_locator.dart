import 'package:dio/dio.dart';
import 'package:platzy_fackstore/core/constants/keys.dart';
import 'package:platzy_fackstore/features/auth/data/abstract/auth_datasource.dart';
import 'package:platzy_fackstore/features/auth/data/abstract/users_datasource.dart';
import 'package:platzy_fackstore/features/auth/data/remote/auth_remote_datasource.dart';
import 'package:platzy_fackstore/features/auth/data/remote/users_remote_datasource.dart';
import 'package:platzy_fackstore/features/home/data/abstract/category_datasource.dart';
import 'package:platzy_fackstore/features/home/data/remote_datasource/product_remote_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/abstract/product_datasource.dart';
import '../../features/home/data/remote_datasource/category_remote_datasource.dart';
import '../network/app_cancel_tokens.dart';
import '../network/app_dio.dart';
import '../network/general_api.dart';
import '../utils/responsive_utils.dart';

final getItInstance = GetIt.instance;

void initDependencyInjection() {
  // SharedPreferences
  getItInstance.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  //  utils
  getItInstance.registerLazySingleton<ResponsiveUtils>(
    () => ResponsiveUtils(),
  );
  // getItInstance.registerLazySingleton<ResponsiveTextStyles>(
  //   () => ResponsiveTextStyles(getItInstance()),
  // );

  //  Dio
  getItInstance.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: dotenv.env[ConstantKeys.baseUrl]!,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
          enabled: kDebugMode,
          filter: (options, args) {
            if (options.path.contains('/posts')) return false;

            return !args.isResponse || !args.hasUint8ListData;
          },
        ),
      ),
  );

  //AppDio
  getItInstance.registerLazySingleton<AppDio>(() => AppDio(getItInstance()));

  //GeneralApi
  getItInstance.registerLazySingleton<GeneralApi>(
    () => GeneralApi(appDio: getItInstance()),
  );

  //Cancel tokens
  getItInstance.registerLazySingleton<AppCancelTokens>(
    () => AppCancelTokens(),
  );

  //Authentication Datasource
  getItInstance.registerLazySingleton<AuthDatasource>(
    () => AuthRemoteDatasource(
      generalApi: getItInstance(),
      appDio: getItInstance(),
    ),
  );

  // Users Datasource
  getItInstance.registerLazySingleton<UsersDatasource>(
    () => UsersRemoteDatasource(
      appDio: getItInstance(),
      generalApi: getItInstance(),
    ),
  );

  // Categories Datasource
  getItInstance.registerLazySingleton<CategoryDatasource>(
    () => CategoryRemoteDatasource(
      appDio: getItInstance(),
      generalApi: getItInstance(),
    ),
  );

  //ProductsRemoteDatasource
  getItInstance.registerLazySingleton<ProductDatasource>(
    () => ProductRemoteDatasource(
      appDio: getItInstance<AppDio>(),
      generalApi: getItInstance<GeneralApi>(),
      appCancelTokens: getItInstance<AppCancelTokens>(),
    ),
  );
}
