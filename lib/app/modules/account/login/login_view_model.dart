import 'package:event_driver_arch/app/modules/account/login/states/fieldStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../domain/repository/remote/account_repository.dart';
import '../../home/home.dart';

class LoginViewModel {
  LoginViewModel({
    required this.accountRepository,
  }) {
    _init();
  }

  final IAccountRepository accountRepository;

  late FieldsStateValidate fieldsStateValidate;

  ValueNotifier<bool> buttonIsLock = ValueNotifier<bool>(true);
  var isLoading = ValueNotifier<bool>(false);

  setCredentialsEmail(String email) =>
      fieldsStateValidate.credentials.email = email;

  setCredentialsPassword(String password) =>
      fieldsStateValidate.credentials.password = password;

  emailIsValid() => fieldsStateValidate.emailValidator();

  passwordIsValid() => fieldsStateValidate.passwordValidator();

  _init() {
    fieldsStateValidate = FieldsStateValidate(false)
      ..addListener(() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          buttonIsLock.value = !fieldsStateValidate.value;
        });
      });
  }

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)).then((value) =>
        // var result = await accountRepository.login(credentials);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
    isLoading.value = false;
  }
}
