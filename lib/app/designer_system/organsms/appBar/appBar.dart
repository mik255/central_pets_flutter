import 'package:event_driver_arch/mainStances.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../tabBar.dart';

enum LeadingState { menu, back, none }

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {Key? key,
      required this.bottom,
      required this.bottomEmable,
      required this.leadingIconAnimatedState,
      required this.scaffoldKey,
      required this.enabled})
      : super(key: key);
  final ValueNotifier<LeadingState> leadingIconAnimatedState;
  final ValueNotifier<bool> bottomEmable;
  final ValueNotifier<bool> enabled;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueNotifier<CustomTabBar> bottom;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

typedef AppBarTabBar = Widget Function(bool value);

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AppBarTabBar tabBar;
  late AnimatedContainer Function(bool value, Widget child) appBarVisible;

  @override
  void initState() {

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    appBarVisible = (value, child) => AnimatedContainer(
          height: value ? null : 0,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 800),
          color: Colors.white,
          child: child,
        );
    tabBar = (value) => AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        height: value ? 50 : 0,
        child: AnimatedOpacity(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            opacity: value ? 1 : 0,
            child: ValueListenableBuilder<CustomTabBar>(
              valueListenable: widget.bottom,
              builder: (context, value, child) {
                return value;
              },
            )));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([widget.enabled, widget.bottomEmable]),
        builder: (context, child) {
          return appBarVisible(
            widget.bottomEmable.value,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            MainStances.navigatorKey.currentState?.pop();
                          },
                          child: AnimatedIcon(
                            icon: AnimatedIcons.menu_arrow,
                            progress: animationController,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                       Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.pets,
                              color: Colors.black54,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Central Pets',
                              style: GoogleFonts.fredoka(
                                letterSpacing: 1.1,
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                tabBar(widget.enabled.value),
              ],
            ),
          );
        });
  }
}
