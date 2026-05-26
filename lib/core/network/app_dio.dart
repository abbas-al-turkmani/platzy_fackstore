import 'package:dio/dio.dart';

import '../constants/keys.dart';

class AppDio {
  late Dio _dio;

  Dio get dio => _dio;

  AppDio(Dio dio) {
    _dio = dio;
  }

  void setJsonHeaders() {
    dio.options.headers.clear();
    dio.options.headers.addAll(getJsonHeaders());
  }

  void setFormDataHeaders() {
    dio.options.headers.clear();
    dio.options.headers.addAll(getFormDataHeaders());
  }

  void addToHeader(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  static Map<String, dynamic> getJsonHeaders() => {
        ConstantKeys.contentType: 'application/json',
        ConstantKeys.accept: '*/*',
      };

  static Map<String, dynamic> getFormDataHeaders() => {
        ConstantKeys.contentType: 'multipart/form-data',
        ConstantKeys.accept: '*/*',
      };
}
