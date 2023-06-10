import 'package:flutter/material.dart';
import 'buttonNavBar.dart';

class PageBaseState {
  PageBaseState({
    required this.index,
  });

  int index;
}

class PageBaseController extends ValueNotifier<PageBaseState> {
  PageController pageController = PageController(initialPage: 0,keepPage: true);
  PageBaseController(super.value);

  void page(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

}

class PageBase extends StatefulWidget {
  const PageBase({
    Key? key,
    required this.controller,
    required this.children,
    this.buttonNavBar,
  }) : super(key: key);
  final PageBaseController controller;
  final List<Widget> children;
  final ButtonNavBar? buttonNavBar;

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> with AutomaticKeepAliveClientMixin<PageBase> {


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        bottomNavigationBar: widget.buttonNavBar,
        body: PageView(
          controller: widget.controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.children,
        ));
  }
  @override
  bool get wantKeepAlive => true;
}
