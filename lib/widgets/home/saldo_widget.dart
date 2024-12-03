import 'dart:ui';

import 'package:flutter/material.dart';
import '../../style/color_style.dart';

class SaldoWidget extends StatefulWidget {
  @override
  _SaldoWidgetState createState() => _SaldoWidgetState();
}

class _SaldoWidgetState extends State<SaldoWidget> {
  bool _isNotified = false; // Track notification icon state

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyle.primaryColor50,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ganesha.png'),
                  radius: 24,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo!',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins_Regular",
                        color: ColorStyle.secondaryTextBlack,
                      ),
                    ),
                    Text(
                      'Ganesha Rahman',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins_SemiBold",
                        color: ColorStyle.primaryTextBlack,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNotified = !_isNotified;
                    });
                  },
                  child: Icon(
                    _isNotified
                        ? Icons.notifications
                        : Icons.notifications_none,
                    color: ColorStyle.iconActive,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Saldo anda',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins_Regular",
                      color: ColorStyle.secondaryTextBlack,
                    ),
                  ),
                  Text(
                    '150.000 IDR',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Poppins_Bold",
                      color: ColorStyle.primaryTextBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
