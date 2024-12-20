import 'package:flutter/material.dart';
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
          ListView(children: [
            SizedBox(
              child: Column(
                children: [
                  const SaldoWidget(),
                  const SizedBox(height: 24),
                  const LargestExpenseWidget(),
                  const SizedBox(height: 48),
                  RecapWidget(),
                  const SizedBox(height: 75),
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

