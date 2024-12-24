import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/home/largest_expense_widget.dart';
import '../widgets/home/saldo_widget.dart';
import '../widgets/home/recap_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: const [
            SizedBox(
              child: Column(
                children: [
                  SaldoWidget(),
                  SizedBox(height: 24),
                  LargestExpenseWidget(),
                  SizedBox(height: 48),
                  RecapWidget(),
                  SizedBox(height: 75),
                ],
              ),
            ),
          ]),
          BottomNavbar(
            currentIndex: 0,
          ),
        ],
      ),
    );
  }
}
