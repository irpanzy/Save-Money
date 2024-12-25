import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'income_expense_box_widget.dart';
import '../../style/color_style.dart';

class IncomeExpenseRowWidget extends StatelessWidget {
  const IncomeExpenseRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController controller = Get.put(HomescreenController());

    return Obx(() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: IncomeExpenseBoxWidget(
                  icon: Symbols.arrow_outward,
                  title: "Pemasukan",
                  amount:
                      CurrencySaldoHelper.formatRupiah(controller.income.value),
                  color: ColorStyle.primaryColor50,
                )),
                const SizedBox(width: 16),
                Expanded(
                    child: IncomeExpenseBoxWidget(
                  icon: Symbols.call_received,
                  title: "Pengeluaran",
                  amount: CurrencySaldoHelper.formatRupiah(
                      controller.expense.value),
                  color: ColorStyle.secondaryColor50,
                )),
              ],
            ),
          ],
        ));
  }
}
