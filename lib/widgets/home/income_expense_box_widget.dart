import 'package:flutter/material.dart';
import '../../models/home/income_expense_data_model.dart';

class IncomeExpenseBoxHome extends StatelessWidget {
  final IncomeExpenseDataHome data;

  IncomeExpenseBoxHome(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
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
              color: Colors.white,
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
              color: Colors.black,
              fontFamily: "Poppins_Bold",
            ),
          ),
        ],
      ),
    );
  }
}