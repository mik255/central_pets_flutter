import 'package:flutter/cupertino.dart';

mixin CustomDecorators {
  static const circularBorderShape = BoxShape.circle;
  static  get shadow => BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 4), // changes position of shadow
  );
  static get softBorderRadius => const BorderRadius.all(Radius.circular(10));
  static get softBorderRadiusTop => const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );
  static get softBorderRadiusBottom => const BorderRadius.only(
    bottomRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
  );
}
