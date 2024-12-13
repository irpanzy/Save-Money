import 'package:flutter/material.dart';

class IncomeExpenseDataModel {
  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  IncomeExpenseDataModel({
    required this.icon,
    required this.title,
    required this.amount,
    required this.color,
  });
}
