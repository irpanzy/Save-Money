import 'package:flutter/material.dart';
import '../../style/color_style.dart';

class IncomeExpenseBoxWidget extends StatelessWidget {
  const IncomeExpenseBoxWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.amount,
      required this.color});
  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorStyle.primaryTextWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: ColorStyle.borderBlack,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: ColorStyle.primaryTextWhite,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Poppins_SemiBold",
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "$amount IDR",
            style: const TextStyle(
              fontSize: 20,
              color: ColorStyle.primaryTextBlack,
              fontFamily: "Poppins_Bold",
            ),
          ),
        ],
      ),
    );
  }
}
