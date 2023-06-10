import 'package:flutter/material.dart';

class SmoothShapeContainer extends Container {
  SmoothShapeContainer({
    Key? key,
    required Widget child,
    double borderRadius = 10.0,
    Color color = Colors.white,
    required double height,
    required double width,
    bool shadow = false,
  }) : super(
    key: key,
    clipBehavior: Clip.antiAlias,
    height: height,
    width: width,
    child: child,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      boxShadow: [
        if(shadow)
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
  );
}