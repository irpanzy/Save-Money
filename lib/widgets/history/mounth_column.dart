import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class MounthColumn extends StatelessWidget {
  final String monthName;
  final double income;
  final double expense;

  const MounthColumn({
    super.key,
    required this.monthName,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: EdgeInsets.only(bottom: 16),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: ColorStyle.primaryColor60,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              monthName,
              style: TypographyStyle.l2Bold,
            ),
          ),
          Text(CurrencyHelper.formatRupiah(income),
              style: TypographyStyle.l1Bold.copyWith(
                color: ColorStyle.incomeColor,
              )),
          Text(CurrencyHelper.formatRupiah(expense),
              style: TypographyStyle.l1Bold.copyWith(
                color: ColorStyle.expenditureColor,
              ))
        ],
      ),
    );
  }
}
