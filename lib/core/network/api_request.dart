import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final dynamic body;
  final Map<String, dynamic>? parameters;
  final String? token;
  final CancelToken? cancelToken;
  final Options? options;
  final Duration? connectTimeout;
  final Duration? receiveTimeout;

  ApiRequest({
    required this.url,
    this.body,
    this.parameters,
    this.token,
    this.cancelToken,
    this.options,
    this.connectTimeout,
    this.receiveTimeout,
  });
}
