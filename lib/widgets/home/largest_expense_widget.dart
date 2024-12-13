import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'expense_item_widget.dart';

class LargestExpenseWidget extends StatelessWidget {
  const LargestExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengeluaran Terbesar Bulan ini',
            style: TypographyStyle.h4,
          ),
          const SizedBox(height: 16),
          const Column(
            children: [
              ExpenseItemWidget('Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
              ExpenseItemWidget('Sedekah', 'Traktir teman', 'Rp50,000.00'),
              ExpenseItemWidget('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
            ],
          ),
        ],
      ),
    );
  }
}
