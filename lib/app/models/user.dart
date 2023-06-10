import 'package:event_driver_arch/domain/models/user.dart';
import 'package:flutter/cupertino.dart';

import 'credentials.dart';

class User extends UserEntity {
  User({
    required super.id,
    required super.name,
    required super.credentials,
    required super.token,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        credentials: Credentials.fromJson(json["credentials"]),
        token: json["token"],
      );
}

