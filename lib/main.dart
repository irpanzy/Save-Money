import 'package:flutter/material.dart';
import 'features/intro_screen.dart';

void main() {
  runApp(SaveMoneyApp());
}

class SaveMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveMoney',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
      },
    );
  }
}
