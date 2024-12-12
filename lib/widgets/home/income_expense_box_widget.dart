import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';
import '../../style/color_style.dart';

class IncomeExpenseBoxWidget extends StatelessWidget {
  final IncomeExpenseDataModel data;

  const IncomeExpenseBoxWidget(this.data, {super.key});

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
              color: data.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              data.icon,
              color: ColorStyle.primaryTextWhite,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Poppins_SemiBold",
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.amount,
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