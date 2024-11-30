import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../widgets/bottom_navbar.dart';

class StatistikScreen extends StatefulWidget {
  const StatistikScreen({super.key});

  @override
  State<StatistikScreen> createState() => _StatistikScreenState();
}

class _StatistikScreenState extends State<StatistikScreen> {
  int _currentIndex = 3;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCFF00),
      body: Center(
        child: Text(
          'Statistik Screen',
          style: TextStyle(fontSize: 24, fontFamily: "Poppins_SemiBold"),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
