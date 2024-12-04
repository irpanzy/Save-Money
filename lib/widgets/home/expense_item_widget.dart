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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins_Bold",
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins_Medium",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
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
