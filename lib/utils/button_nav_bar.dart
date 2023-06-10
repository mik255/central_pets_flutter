import 'package:flutter/material.dart';
import '../app/designer_system/organsms/buttonNavBar.dart';

ValueNotifier<int> currentState = ValueNotifier<int>(0);

ButtonNavBar buttonNavBar() => ButtonNavBar(
      items: [
        const BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: Colors.black87,
          ),
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.search,
            color: Colors.black87,
          ),
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        const BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.sticky_note_2,
            color: Colors.black87,
          ),
          icon: Icon(Icons.sticky_note_2),
          label: 'Cupons',
        ),
        BottomNavigationBarItem(
          activeIcon: Badge(
            label: Text('1'),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.grey[300],
            ),
          ),
          icon: const Badge(label: Text('1'), child: Icon(Icons.shopping_cart)),
          label: 'Carrinho',
        ),
        BottomNavigationBarItem(
          activeIcon: Badge(
            label: Text('3'),
            child: Icon(
              Icons.person,
              color: Colors.grey[300],
            ),
          ),
          icon: const Badge(
              label: Text('3'),
              child: Icon(
                Icons.person,
              )),
          label: 'Perfil',
        ),
      ],
      isHideNavBar: ValueNotifier<bool>(false),
      currentState: currentState,
      onTap: (value) {
        currentState.value = value;
      },
    );
