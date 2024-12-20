import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'income_expense_row_widget.dart';
import 'doughnut_chart_widget.dart';

class RecapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recap bulan ini', style: TypographyStyle.h4),
          const SizedBox(height: 16),
          const IncomeExpenseRowWidget(),
          const SizedBox(height: 32),
          DoughnutChart(),
        ],
      ),
    );
  }
}
