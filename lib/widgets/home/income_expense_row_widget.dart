import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';
import 'income_expense_box_widget.dart';

class IncomeExpenseRowHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataList = [
      IncomeExpenseDataHome(
        icon: Icons.arrow_upward,
        title: 'Pemasukan',
        amount: '2.000 IDR',
        color: Color(0xFFB2E600),
      ),
      IncomeExpenseDataHome(
        icon: Icons.arrow_downward,
        title: 'Pengeluaran',
        amount: '10.000 IDR',
        color: Color(0xFFE60000),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recap bulan ini',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins_Bold",
          ),
        ),
        SizedBox(height: 15), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dataList
              .map((data) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IncomeExpenseBoxHome(data),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}