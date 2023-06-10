import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    Key? key,
    required this.onTap,
    required this.currentState,
    required this.isHideNavBar,
    required this.items,
  }) : super(key: key);
  final ValueNotifier<bool> isHideNavBar;
  final ValueNotifier<int> currentState;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([isHideNavBar, currentState]),
        builder: (context, child) {
          return Visibility(
            visible: !isHideNavBar.value,
            maintainAnimation: true,
            maintainState: true,
            child: NavigationBar(
              onDestinationSelected: onTap,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.grey[100],
              indicatorColor: Colors.grey[500],
              animationDuration: const Duration(milliseconds: 800),

              selectedIndex: currentState.value,
              destinations: [
                ...items.map((e) => NavigationDestination(
                      selectedIcon: e.activeIcon,
                      icon: e.icon,
                      label: e.label!,
                    ))
              ],
            ),
          );
        });
  }
}
