import 'package:flutter/material.dart';

class CustomTabBar extends TabBar {
  const CustomTabBar({
    Key? key,
    required List<Widget> tabs,
    required TabController controller,
  }) : super(
          key: key,
          tabs: tabs,
          isScrollable: true,
          controller: controller,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
          ),
        );
}
