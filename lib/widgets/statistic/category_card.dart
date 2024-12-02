import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String amount;
  final bool isIncomeSelected;
  final double percentage;

  const CategoryCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.isIncomeSelected,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    print('isIncomeSelected on $title: $isIncomeSelected');
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorStyle.borderBlack, // Warna border
          width: 1, // Ketebalan border
        ),
        borderRadius: BorderRadius.circular(8), // Radius sudut border
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isIncomeSelected
                ? ColorStyle.primaryColor60
                : ColorStyle.secondaryColor50,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            '$percentage%',
            style: isIncomeSelected
                ? TypographyStyle.l3Bold
                : TypographyStyle.l3Bold.copyWith(color: Colors.white),
          ),
        ),
        title: Text(
          title,
          style: TypographyStyle.l2Regular,
        ),
        trailing: Text(amount, style: TypographyStyle.l2Regular),
      ),
    );
  }
}
