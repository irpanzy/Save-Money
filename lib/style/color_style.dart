import 'package:flutter/material.dart';

class ColorStyle {
  static Color primaryColor50 = const Color(0xFFCCFF00);
  static Color primaryColor60 = const Color(0xFFB2E600);
  static Color primaryColor80 = const Color(0xFF455C0B);  

  static Color secondaryColor50 = const Color(0xFFE60000);
  static Color secondaryColor80 = const Color(0xFF7D0000);

  // Text Colors
  static const primaryTextBlack = Color(0xE4000000); // Opacity 90%
  static const secondaryTextBlack = Color(0xB0000000); // Opacity 70%
  static const primaryTextWhite = Color(0xFFFFFFFF);
  static Color incomeColor = const Color(0xFF8AB800);
  static Color expenditureColor = const Color(0xFFE60000);

  // Border Colors
  static const borderBlackActive = Color(0xCC000000);
  static const borderBlack = Color(0x33000000);
  static const borderBlackLow = Color.fromRGBO(0, 0, 0, 0.050);
  static const grey = Color.fromARGB(255, 158, 158, 158);
  // ignore: constant_identifier_names
  static const Shadow = Color.fromRGBO(0, 0, 0, 0.06);

  // Icon Colors
  static const iconActive = Color(0xE3000000);
  static const iconNotActive = Color(0x66000000);
  static const black54 = Color.fromARGB(138, 0, 0, 0);
  static const incomeColorHome = Color(0xFFB2E600);
  static const expenditureColorHome = Color(0xFFE60000);
  static const incomeChartHome = Color(0xFFB2E600);
}
