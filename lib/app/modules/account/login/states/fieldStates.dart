import 'package:flutter/cupertino.dart';
import '../../../../models/credentials.dart';

class FieldsStateValidate extends ValueNotifier<bool> {
  FieldsStateValidate(super.value);

  final Credentials credentials = Credentials(email: '', password: '');
  bool emailIsValidate = false;
  bool passwordIsValidate = false;

  String? emailValidator() {
    String? error;
    try {
      credentials.isValidEmail();
    } catch (e) {
      error = e.toString();
    }
    emailIsValidate = error == null;
    _isAllValidate();
    return error;
  }

  String? passwordValidator() {
    String? error;
    try {
      credentials.isValidPassword();
    } catch (e) {
      error = e.toString();
    }
    passwordIsValidate = error == null;
    _isAllValidate();
    return error;
  }

  _isAllValidate() {
    value = emailIsValidate && passwordIsValidate;
  }
}
