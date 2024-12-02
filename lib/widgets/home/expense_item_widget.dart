import 'package:flutter/material.dart';
import '../../style/color_style.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins_Bold",
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins_Medium",
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              color: ColorStyle.expenditureColor,
              fontFamily: "Poppins_Medium",
            ),
          ),
        ],
      ),
    );
  }
}
