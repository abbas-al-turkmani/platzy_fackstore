import 'dart:convert';

class NewUser {
  final String name;
  final String email;
  final String password;
  final String avatar;

  NewUser({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  factory NewUser.fromMap(Map<String, dynamic> map) {
    return NewUser(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUser.fromJson(String source) =>
      NewUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
