import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class ExpenseItemWidget extends StatelessWidget {
  final String category;
  final String description;
  final String amount;

  const ExpenseItemWidget(this.category, this.description, this.amount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(category, style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(description, style: TypographyStyle.p2Regular)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  amount,
                  style: TypographyStyle.p2Regular
                      .copyWith(color: ColorStyle.expenditureColor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
