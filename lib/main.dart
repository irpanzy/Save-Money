import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/screens/category_input_screen.dart';
import 'package:project_apk_catatan_keuangan/screens/update_transaksi_screen.dart';
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

class SaveMoneyApp extends StatelessWidget {
  const SaveMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(HomescreenController());
      }),
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
        GetPage(
          name: '/update',
          page: () => UpdateTransactionScreen(),
        ),
        GetPage(
          name: '/input_category',
          page: () => const InputCategoryScreen(),
        ),
      ],
    );
  }
}
