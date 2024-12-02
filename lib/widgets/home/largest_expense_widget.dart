import 'package:flutter/material.dart';
import 'expense_item_widget.dart';

class LargestExpenseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pengeluaran Terbesar Bulan ini',
          style: TextStyle(fontSize: 18, fontFamily: "Poppins_Bold"),
        ),
        SizedBox(height: 8),
        Column(
          children: [
            ExpenseItemHome('Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
            ExpenseItemHome('Sedekah', 'Traktir teman', 'Rp50,000.00'),
            ExpenseItemHome('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
          ],
        ),
      ],
    );
  }
}
