import 'package:flutter/material.dart';
import '../../mainStances.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
              ),
              child: Text('Drawer Header'),
            ),
            
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                MainStances.navigatorKey.currentState!.pushNamed('/store');
                MainStances.navigatorKey.currentState!.pop();
              },
            ),
            ListTile(
              title: const Text('sair'),
              onTap: () {
                MainStances.navigatorKey.currentState!.pushNamed('/login');
                MainStances.navigatorKey.currentState!.pop();
              },
            ),
          ],
        )
    );
  }
}
