import 'package:flutter/material.dart';

class SaldoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCCFF00), Color(0xFFB2E600)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/ganesha.png'),
                radius: 24,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo!',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins_Regular",
                    ),
                  ),
                  Text(
                    'Ganesha Rahman',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Poppins_SemiBold"),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.notifications_none, color: Colors.black54),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Saldo anda',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins_Regular",
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '150.000 IDR',
                  style: TextStyle(
                      fontSize: 40, fontFamily: "Poppins_Bold"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
