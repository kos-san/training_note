import 'package:flutter/material.dart';

class NavBar {

  static BottomNavigationBar bottomNavigationBar() {
    List<BottomNavigationBarItem> bottomNavBarItems() {
      return[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '記録',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ];
    }
    return BottomNavigationBar(
      items: bottomNavBarItems(),
      type: BottomNavigationBarType.fixed,
    );
  }
}