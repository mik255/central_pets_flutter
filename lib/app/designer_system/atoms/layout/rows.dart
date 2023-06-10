import 'package:flutter/material.dart';

import 'paddings.dart';

mixin CustomRow on CustomPadding {
  get centerRow => (List<Widget> children) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );

  get centerStartRow => (List<Widget> children) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      );

  get centerEndRow => (List<Widget> children) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        ),
      );

  get startCenterRow => (List<Widget> children) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );

  get listWrapItemsRow => (List<Widget> children) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: itemPadding,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: children,
        ),
      );
}
