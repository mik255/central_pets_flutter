import 'dart:convert';
import '../../../app/models/credentials.dart';
import '../../models/account.dart';
import '../../models/credentials.dart';
import '../../repository/local/localRepository.dart';
import '../../repository/remote/account_repository.dart';

class LoginUsecase {
  final IAccountRepository accountRepository;
   final ILocalRepository iLocalRepository;
  LoginUsecase({
    required this.accountRepository,
    required this.iLocalRepository,
  });

  Future<Account> call(Credentials credentials) async {
    try {
      credentials.isValidEmail();
      credentials.isValidPassword();
      final response = await accountRepository.login(
        credentials,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
