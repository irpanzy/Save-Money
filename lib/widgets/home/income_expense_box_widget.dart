import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';
import '../../style/color_style.dart';

class IncomeExpenseBoxWidget extends StatelessWidget {
  final IncomeExpenseDataModel data;

  IncomeExpenseBoxWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorStyle.primaryTextWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
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
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              data.icon,
              color: ColorStyle.primaryTextWhite,
            ),
          ),
          SizedBox(height: 20),
          Text(
            data.title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins_SemiBold",
            ),
          ),
          SizedBox(height: 2),
          Text(
            data.amount,
            style: TextStyle(
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