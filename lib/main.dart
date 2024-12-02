import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/screens/statistic_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_name_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(SaveMoneyApp());
}

class SaveMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaveMoney',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/input_name': (context) => InputNameScreen(),
        '/home': (context) => HomeScreen(),
        '/statistik': (context) => StatisticsPage()
      },
    );
  }
}
