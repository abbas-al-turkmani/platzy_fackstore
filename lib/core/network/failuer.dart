import 'package:dio/dio.dart';

class Failuer {
  final String error;
  final int statusCode;
  const Failuer({
    required this.error,
    required this.statusCode,
  });

  factory Failuer.empty() => const Failuer(error: '', statusCode: 0);

  factory Failuer.handleExeption(Object exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return Failuer(
            error: 'Connection Timeout!',
            statusCode: -1,
          );
        case DioExceptionType.sendTimeout:
          return Failuer(
            error: 'Send Timeout!',
            statusCode: exception.response!.statusCode!,
          );
        case DioExceptionType.receiveTimeout:
          return Failuer(
            error: 'Receive Timeout!',
            statusCode: exception.response!.statusCode!,
          );
        case DioExceptionType.badCertificate:
          return Failuer(
            error: 'Bad Certificate!',
            statusCode: exception.response!.statusCode!,
          );
        case DioExceptionType.badResponse:
          if (exception.response!.statusCode == 500) {
            return Failuer(
              error: 'Server Error!',
              statusCode: exception.response!.statusCode!,
            );
          } else if (exception.response!.statusCode == 404) {
            return Failuer(
              error: 'Bad Request!',
              statusCode: exception.response!.statusCode!,
            );
          } else {
            return Failuer(
              error: exception.response!.data['message'],
              statusCode: exception.response!.statusCode!,
            );
          }
        case DioExceptionType.cancel:
          return Failuer(
            error: 'Coldn\'t Cancel request!',
            statusCode: exception.response!.statusCode!,
          );
        case DioExceptionType.connectionError:
          return Failuer(
            error: 'Check your internet connection!',
            statusCode: exception.response!.statusCode!,
          );
        case DioExceptionType.unknown:
          return Failuer(
            error: 'Unknown error happened!',
            statusCode: (exception.response ??
                    Response(
                      requestOptions: RequestOptions(),
                      statusCode: -1,
                    ))
                .statusCode!,
          );
      }
    }

    return const Failuer(
      error: 'Error happened!',
      statusCode: -1,
    );
  }

  bool isEmpty() => error.isEmpty && statusCode == 0;
}
