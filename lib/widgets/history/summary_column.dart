import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class SummaryColumn extends StatelessWidget {
  final String label;
  final String amount;
  final Color amountColor;

  const SummaryColumn({
    super.key,
    required this.label,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TypographyStyle.l3Regular,
        ),
        const SizedBox(height: 4),
        Text(amount,
            style: TypographyStyle.p1Bold.copyWith(color: amountColor)),
      ],
    );
  }
}
