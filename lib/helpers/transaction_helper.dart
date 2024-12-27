import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class TransactionHelper {
  static double calculateIncome(List<TransactionModel> transactions) {
    return transactions
        .where((transaction) => transaction.categoryType == 'Income')
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  static double calculateExpense(List<TransactionModel> transactions) {
    return transactions
        .where((transaction) => transaction.categoryType == 'Expense')
        .fold(0.0, (sum, transaction) => sum + transaction.amount.abs());
  }
}

