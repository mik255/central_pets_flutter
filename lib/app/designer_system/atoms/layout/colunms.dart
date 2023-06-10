import 'package:event_driver_arch/app/designer_system/atoms/layout/paddings.dart';
import 'package:flutter/material.dart';

mixin CustomColumn on CustomPadding{
  get centerColumn => (List<Widget> children) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );
  get centerStartColumn => (List<Widget> children) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
  get centerEndColumn => (List<Widget> children) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    ),
  );
  get startCenterColumn => (List<Widget> children) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
  get listWrapItems => (List<Widget> children) => SingleChildScrollView(
    child: Wrap(
      spacing: itemPadding,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: children,
    ),
  );
}
