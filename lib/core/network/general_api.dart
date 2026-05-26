import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'api_request.dart';
import 'api_response.dart';
import 'app_dio.dart';
import 'failuer.dart';

class GeneralApi {
  final AppDio appDio;

  GeneralApi({required this.appDio});

  Future<Either<Failuer, ApiResponse>> get(ApiRequest apiRequest) async {
    return _handelResponse(appDio.dio.get, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> post(ApiRequest apiRequest) {
    return _handelResponse(appDio.dio.post, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> delete(ApiRequest apiRequest) async {
    return _handelResponse(appDio.dio.delete, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> put(ApiRequest apiRequest) async {
    return _handelResponse(appDio.dio.put, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> patch(ApiRequest apiRequest) async {
    return _handelResponse(appDio.dio.patch, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> fetch(ApiRequest apiRequest) async {
    return _handelResponse(appDio.dio.fetch, apiRequest);
  }

  Future<Either<Failuer, ApiResponse>> _handelResponse(
      dynamic method, ApiRequest apiRequest) async {
    try {
      final Response response = await method(
        apiRequest.url,
        data: apiRequest.body,
        queryParameters: apiRequest.parameters,
      );

      return right(
        ApiResponse(
          statusCode: response.statusCode ?? 0,
          body: response.data,
        ),
      );
    } catch (e) {
      return left(Failuer.handleExeption(e));
    }
  }
}
