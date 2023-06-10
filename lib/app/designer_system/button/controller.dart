import 'package:flutter/cupertino.dart';

class ButtonController extends ValueNotifier<bool> {
  ButtonController() : super(false);

 void setLoading(bool isLoading) {
    value = isLoading;
  }
}
