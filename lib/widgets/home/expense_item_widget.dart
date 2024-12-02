import 'package:flutter/material.dart';

class ExpenseItemHome extends StatelessWidget {
  final String category;
  final String description;
  final String amount;

  ExpenseItemHome(this.category, this.description, this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins_Medium",
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontFamily: "Poppins_Regular",
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFE60000),
              fontFamily: "Poppins_Medium",
            ),
          ),
        ],
      ),
    );
  }
}
