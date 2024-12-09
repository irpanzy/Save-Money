import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/statistik_screen.dart';
import 'screens/input_screen.dart';
import 'screens/history_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_name_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(SaveMoneyApp());
}

// Global state untuk menyimpan transaksi
List<Map<String, dynamic>> globalTransactions = [];

class SaveMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save Money',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/input_name': (context) => InputNameScreen(),
        '/home': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(),
        '/input': (context) => InputScreen(),
        '/statistik': (context) => StatistikScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
