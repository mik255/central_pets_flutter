import 'package:event_driver_arch/app/models/user.dart';

class Account {
  Account({
    required this.id,
    required this.user,
    required this.token,
  });

  final String id;
  User user;
  final String token;
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );
}
