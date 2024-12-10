import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'expense_item_widget.dart';

class LargestExpenseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pengeluaran Terbesar Bulan ini',
          style: TypographyStyle.h4,
        ),
        const SizedBox(height: 15),
        Column(
          children: [
            ExpenseItemWidget('Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
            ExpenseItemWidget('Sedekah', 'Traktir teman', 'Rp50,000.00'),
            ExpenseItemWidget('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
          ],
        ),
      ],
    );
  }
}
