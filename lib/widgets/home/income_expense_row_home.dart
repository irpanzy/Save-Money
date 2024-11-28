import 'package:flutter/material.dart';
import 'income_expense_box_home.dart';

class IncomeExpenseRowHome extends StatelessWidget {
  final String title;

  IncomeExpenseRowHome({required this.title});

  @override
  Widget build(BuildContext context) {
    // Data kotak pemasukan dan pengeluaran
    final dataList = [
      {
        "icon": Icons.arrow_upward,
        "title": "Pemasukan",
        "amount": "2.000 IDR",
        "color": Color(0xFFB2E600),
      },
      {
        "icon": Icons.arrow_downward,
        "title": "Pengeluaran",
        "amount": "10.000 IDR",
        "color": Color(0xFFE60000),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins_Bold",
          ),
        ),
        SizedBox(height: 15), // Jarak antara judul dan kotak

        // Row berisi kotak pemasukan & pengeluaran
        Row(
          children: dataList.map((data) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IncomeExpenseBoxHome(
                  data["icon"] as IconData,
                  data["title"] as String,
                  data["amount"] as String,
                  data["color"] as Color,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
