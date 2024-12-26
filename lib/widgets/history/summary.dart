import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/summary_column.dart';

class SummaryCashflow extends StatelessWidget {
  const SummaryCashflow({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController controller = Get.put(HomescreenController());
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
            amount: CurrencySaldoHelper.formatRupiah(controller.income.value),
            amountColor: ColorStyle.incomeColor,
          ),
          SummaryColumn(
            label: "Pengeluaran",
            amount: CurrencySaldoHelper.formatRupiah(controller.expense.value),
            amountColor: ColorStyle.expenditureColor,
          ),
          SummaryColumn(
            label: "Saldo",
            amount: CurrencySaldoHelper.formatRupiah(controller.saldo.value),
            amountColor: ColorStyle.primaryTextBlack,
          ),
        ],
      ),
    );
  }
}
