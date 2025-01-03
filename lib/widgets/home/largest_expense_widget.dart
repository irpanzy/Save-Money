import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'expense_item_widget.dart';

class LargestExpenseWidget extends StatelessWidget {
  const LargestExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController controller = Get.put(HomescreenController());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Obx(() {
        if (controller.largestExpenses.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengeluaran Terbesar Bulan ini',
                style: TypographyStyle.h4,
              ),
              const SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    'Tidak ada pengeluaran di bulan ini.',
                    style: TypographyStyle.l2Regular,
                  ),
                ),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengeluaran Terbesar Bulan ini',
              style: TypographyStyle.h4,
            ),
            const SizedBox(height: 16),
            Column(
              children: controller.largestExpenses.map((expense) {
                return ExpenseItemWidget(
                  "${expense.categoryTitle}",
                  expense.description,
                  CurrencyHelper.formatRupiah(expense.amount),
                );
              }).toList(),
            ),
          ],
        );
      }),
    );
  }
}
