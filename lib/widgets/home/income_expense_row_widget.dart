import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';
import 'income_expense_box_widget.dart';
import '../../style/color_style.dart';

class IncomeExpenseRowWidget extends StatelessWidget {
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
                      child: IncomeExpenseBoxWidget(data),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}