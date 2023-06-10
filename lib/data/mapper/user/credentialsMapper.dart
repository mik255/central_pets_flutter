import 'dart:convert';

import 'package:event_driver_arch/domain/models/credentials.dart';

import '../../../app/models/credentials.dart';

class CredentialsMapper extends Credentials {
  CredentialsMapper({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'userEmail': email,
      'userPassword': password,
    };
  }
  factory CredentialsMapper.fromJson(Map<String, dynamic> json) {
    return CredentialsMapper(
      email: json['userEmail'],
      password: json['userPassword'],
    );
  }
  String encode() {
    return json.encode(toJson());
  }

  static CredentialsMapper fromEntity(CredentialsEntity credentials) {
    return CredentialsMapper(
      email: credentials.email,
      password: credentials.password,
    );
  }
}
