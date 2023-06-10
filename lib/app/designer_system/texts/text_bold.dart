
import 'package:flutter/material.dart';

class TextBold extends Text {
  TextBold(
    String data, {
    Key? key,
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          data,
          key: key,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
          ),
        );
}