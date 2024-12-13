import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';
import 'income_expense_box_widget.dart';
import '../../style/color_style.dart';

class IncomeExpenseRowWidget extends StatelessWidget {
  const IncomeExpenseRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dataList = [
      IncomeExpenseDataModel(
        icon: Icons.arrow_outward,
        title: 'Pemasukan',
        amount: '2.000 IDR',
        color: ColorStyle.incomeColorHome,
      ),
      IncomeExpenseDataModel(
        icon: Icons.call_received,
        title: 'Pengeluaran',
        amount: '10.000 IDR',
        color: ColorStyle.expenditureColorHome,
      ),
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: IncomeExpenseBoxWidget(dataList[0])),
            const SizedBox(width: 16),
            Expanded(child: IncomeExpenseBoxWidget(dataList[1])),
          ],
        ),
      ],
    );
  }
}
