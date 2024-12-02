import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFF00),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SaveMoney',
                    style: TextStyle(fontSize: 40, fontFamily: "Poppins_SemiBold"), 
                  ),
                  Text(
                    'Kelola keuangan anda',
                    style: TextStyle(fontSize: 12, fontFamily: "Poppins_Light"), 
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input_name');
              },
              child: const Text('Start'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: const Color(0xFFCCFF00),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(fontSize: 18, fontFamily: "Poppins_Regular"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
