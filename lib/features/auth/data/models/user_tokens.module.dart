import 'dart:convert';

class UserTokens {
  final String accessToken;
  final String refreshToken;

  UserTokens({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory UserTokens.fromMap(Map<String, dynamic> map) {
    return UserTokens(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokens.fromJson(String source) =>
      UserTokens.fromMap(json.decode(source) as Map<String, dynamic>);
}
