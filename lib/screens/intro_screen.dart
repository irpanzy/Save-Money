import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/input_name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFCCFF00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SaveMoney',
              style: TextStyle(fontSize: 40, fontFamily: "Poppins_SemiBold"),
            ),
            SizedBox(height: 8),
            Text(
              'Kelola keuangan anda',
              style: TextStyle(fontSize: 12, fontFamily: "Poppins_Light"),
            ),
          ],
        ),
      ),
    );
  }
}
