

import 'package:event_driver_arch/domain/models/credentials.dart';

class Credentials extends CredentialsEntity {
  Credentials({
    required super.email,
    required super.password,
  });
  validate(){
    isValidEmail();
    isValidPassword();
  }
  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
    email: json["email"],
    password: json["password"],
  );
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}