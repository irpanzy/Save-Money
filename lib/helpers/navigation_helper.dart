import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/history');
        break;
      case 2:
        Navigator.pushNamed(context, '/input');
        break;
      case 3:
        Navigator.pushNamed(context, '/statistik');
        break;
      case 4:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }
}
