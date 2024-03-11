import 'dart:convert';

class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String token;
  final String type;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.token,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'token': token,
      'type': type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
