import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/summary_column.dart';

class SummaryCashflow extends StatelessWidget {
  const SummaryCashflow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorStyle.borderBlack,
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SummaryColumn(
            label: "Pemasukan",
            amount: "Rp450.000",
            amountColor: ColorStyle.incomeColor,
          ),
          SummaryColumn(
            label: "Pengeluaran",
            amount: "Rp550.000",
            amountColor: ColorStyle.expenditureColor,
          ),
          const SummaryColumn(
            label: "Saldo",
            amount: "Rp150.000",
            amountColor: ColorStyle.primaryTextBlack,
          ),
        ],
      ),
    );
  }
}
