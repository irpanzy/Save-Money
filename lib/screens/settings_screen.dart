import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../widgets/bottom_navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 4;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFF00),
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Settings Screen',
              style: TextStyle(fontSize: 24, fontFamily: "Poppins_SemiBold"),
            ),
          ),
          BottomNavbar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          )
        ],
      ),
    );
  }
}
