import 'package:flutter/material.dart';

mixin TextWeight {
  static TextStyle get textNormalStyle => const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      );

  static TextStyle get textBoldStyle => const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w700,
      );
}

class TextStyles {
  //
  static get title => TextWeight.textNormalStyle.copyWith(fontSize: 36);

  static get subtitle => TextWeight.textNormalStyle.copyWith(fontSize: 24);

  static get body => TextWeight.textNormalStyle.copyWith(fontSize: 16);

  static get button => TextWeight.textNormalStyle.copyWith(fontSize: 16);

  static get caption => TextWeight.textNormalStyle.copyWith(fontSize: 12);

  static get overLine => TextWeight.textNormalStyle.copyWith(fontSize: 10);

  //bold

  static get titleBold => TextWeight.textBoldStyle.copyWith(fontSize: 36);

  static get subtitleBold => TextWeight.textBoldStyle.copyWith(fontSize: 24);

  static get bodyBold => TextWeight.textBoldStyle.copyWith(fontSize: 16);

  static get buttonBold => TextWeight.textBoldStyle.copyWith(fontSize: 16);

  static get captionBold => TextWeight.textBoldStyle.copyWith(fontSize: 12);

  static get overLineBold => TextWeight.textBoldStyle.copyWith(fontSize: 10);

  static get blackButtonBoldW700 => buttonBold.copyWith(
    color: Colors.black,
    fontFamily: "Inter",
  );

  static get whiteButtonNormalW500 => button.copyWith(
    color: Colors.white,
    fontFamily: "Inter",
  );

  static get whiteSubtitleBoldW700=> subtitleBold.copyWith(
    color: Colors.white,
    fontFamily: "Inter",
  );

}
