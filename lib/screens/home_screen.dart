import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/home/largest_expense_widget.dart';
import '../widgets/home/saldo_widget.dart';
import '../widgets/home/recap_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            SaldoSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  LargestExpenseSection(),
                  const SizedBox(height: 75),
                  RecapSection(),
                  const SizedBox(height: 75),
                ],
              ),
            ),
          ]),
          BottomNavbar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}
