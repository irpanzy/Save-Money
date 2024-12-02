import 'package:flutter/material.dart';
import 'income_expense_row_widget.dart';
import 'doughnut_chart_widget.dart';

class RecapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IncomeExpenseRowWidget(),
        SizedBox(height: 40),
        DoughnutChart(),
      ],
    );
  }
}
