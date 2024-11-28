import 'package:flutter/material.dart';

class IncomeExpenseBoxHome extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  IncomeExpenseBoxHome(this.icon, this.title, this.amount, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins_SemiBold",
            ),
          ),
          SizedBox(height: 2),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Poppins_Bold",
            ),
          ),
        ],
      ),
    );
  }
}