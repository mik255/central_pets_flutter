import 'package:flutter/cupertino.dart';

class CustomTextFieldControllerState {
  final bool enable;
  final bool obscureText;

  CustomTextFieldControllerState({required this.enable, this.obscureText = true});

  copyWith({bool? enable, bool? obscureText}) {
    return CustomTextFieldControllerState(
      enable: enable ?? this.enable,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

class CustomTextFieldController
    extends ValueNotifier<CustomTextFieldControllerState> {
  CustomTextFieldController(CustomTextFieldControllerState textFieldControllerState)
      : super(textFieldControllerState);
  final textFildController = TextEditingController();

  void setEnable(bool isEnable) {
    value = value.copyWith(enable: isEnable);
  }

}
