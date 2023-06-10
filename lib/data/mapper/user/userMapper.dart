import 'dart:convert';

import '../../../app/models/user.dart';
import 'credentialsMapper.dart';

class UserMapper extends User {
  UserMapper({
    required super.id,
    required super.name,
    required super.credentials,
    required super.token,
  });

  factory UserMapper.fromJson(Map<String, dynamic> json) {
    return UserMapper(
      id: json['id'],
      name: json['name'],
      credentials: CredentialsMapper.fromJson(json['credentials']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credentials': (credentials as CredentialsMapper).toJson(),
      'token': token,
    };
  }
  factory UserMapper.fromEncodedString(String encoded) {
    final data = json.decode(encoded);
    return UserMapper.fromJson(data);
  }
  toEncodedString() {
    return json.encode(toJson());
  }
  static UserMapper fromEntity(User user) {
    return UserMapper(
      id: user.id,
      name: user.name,
      credentials: CredentialsMapper(
        email: user.credentials.email,
        password: user.credentials.password,
      ),
      token: user.token,
    );
  }
}
