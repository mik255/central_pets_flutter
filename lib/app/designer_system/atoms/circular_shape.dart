
import 'package:event_driver_arch/app/designer_system/atoms/styles/decorators/decorators.dart';
import 'package:flutter/material.dart';

class CircularShape extends Container{
  CircularShape(
      {Key? key,
      required Widget child,
      Color color = Colors.white,
      required double height,
      required double width,
      bool? shadow,
      })
      : super(
          key: key,
          clipBehavior: Clip.antiAlias,
          height: height,
          width: width,
          child: child,
          decoration: BoxDecoration(
            shape: CustomDecorators.circularBorderShape,
            color: color,
            boxShadow: [
              if(shadow!=null&&shadow==true)
              CustomDecorators.shadow
            ],
          ),
        ) ;
}
