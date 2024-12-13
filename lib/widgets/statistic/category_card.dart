import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final String amount;
  final bool isIncomeSelected;
  final int percentage;

  const CategoryCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.isIncomeSelected,
      required this.percentage});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorStyle.borderBlack,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8), // Radius sudut border
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.isIncomeSelected
                ? ColorStyle.primaryColor60
                : ColorStyle.secondaryColor50,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            '${widget.percentage}%',
            style: widget.isIncomeSelected
                ? TypographyStyle.l3Bold.copyWith(color: Colors.black)
                : TypographyStyle.l3Bold.copyWith(color: Colors.white),
          ),
        ),
        title: Text(
          widget.title,
          style: TypographyStyle.l2Regular,
        ),
        trailing: Text(widget.amount, style: TypographyStyle.l2Regular),
      ),
    );
  }
}
