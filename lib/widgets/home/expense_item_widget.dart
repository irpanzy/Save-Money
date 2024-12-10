import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';


class ExpenseItemWidget extends StatelessWidget {
  final String category;
  final String description;
  final String amount;

  ExpenseItemWidget(this.category, this.description, this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(category, style: TypographyStyle.p2Regular),
                ),
                Expanded(
                  flex: 3,
                  child: Text(description, style: TypographyStyle.p2Regular),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(amount, style: TypographyStyle.p2Bold),
        ],
      ),
    );
  }
}
