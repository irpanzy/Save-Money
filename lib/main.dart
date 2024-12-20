import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/settings_screen.dart';
import 'screens/statistik_screen.dart';
import 'screens/input_screen.dart';
import 'screens/history_screen.dart';
import 'screens/home_screen.dart';
import 'screens/input_name_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const SaveMoneyApp());
}

List<Map<String, dynamic>> globalTransactions = [];

class SaveMoneyApp extends StatelessWidget {
  const SaveMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save Money',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const IntroScreen()),
        GetPage(name: '/input_name', page: () => InputNameScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/history', page: () => const HistoryScreen()),
        GetPage(name: '/input', page: () => const InputScreen()),
        GetPage(name: '/statistik', page: () => const StatistikScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
      ],
    );
  }
}
