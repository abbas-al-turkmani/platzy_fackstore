import 'package:dio/dio.dart';

class AppCancelTokens {
  final Map<String, CancelToken> _map = {};
  CancelToken? getToken(String key) => _map[key];

  void cancelTokenIfExists(String key) {
    if (_map[key] != null) _map[key]?.cancel();
  }

  void modifyToken(String key) {
    if (_map[key] == null) {
      _map.addAll({key: CancelToken()});
    } else {
      _map[key] = CancelToken();
    }
  }
}
