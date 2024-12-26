import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class WeekColumn extends StatelessWidget {
  const WeekColumn({
    super.key,
    required this.weekNumber,
    required this.dateRange,
    required this.income,
    required this.expense,
  });

  final int weekNumber;
  final String dateRange;
  final double income;
  final double expense;

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
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorStyle.primaryColor60,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Minggu $weekNumber",
                  style: TypographyStyle.l3Bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(dateRange, style: TypographyStyle.h5),
            ],
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
