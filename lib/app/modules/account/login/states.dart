import 'package:flutter/cupertino.dart';

import '../../../models/credentials.dart';

final credentials = Credentials(
  email: '',
  password: '',
);
final buttonState =
    (isLock: ValueNotifier<bool>(true), isLoading: ValueNotifier<bool>(false));
var fieldsState = (
  emailValidate: false,
  passwordValidate: false,
);
