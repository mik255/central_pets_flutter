import 'credentials.dart';

class UserEntity {
  String id;
  String name;
  CredentialsEntity credentials;
  String token;

  UserEntity({
    required this.id,
    required this.name,
    required this.credentials,
    required this.token,
  });
}
