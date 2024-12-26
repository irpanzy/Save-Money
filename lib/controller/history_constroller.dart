import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class HistoryController extends GetxController {
  var selectedFilter = "Hari".obs;
  var searchQuery = "".obs;
  var transactions = <TransactionModel>[].obs;

  final dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadAllTransactions();
  }

  Future<void> loadAllTransactions() async {
    final data = await dbHelper.getAllTransactions();
    transactions.assignAll(data);
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterTransactions();
  }

  Map<String, List<TransactionModel>> groupTransactionsByDay() {
    final Map<String, List<TransactionModel>> groupedTransactions = {};
    for (var transaction in transactions) {
      if (transaction.date.isEmpty) {
        continue;
      }

      try {
        final date =
            DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction.date));
        if (groupedTransactions[date] == null) {
          groupedTransactions[date] = [];
        }
        groupedTransactions[date]!.add(transaction);
      } catch (e) {
        print(
            'Error parsing date for transaction: ${transaction.date}, Error: $e');
      }
    }

    groupedTransactions.forEach((key, value) {
      value.sort(
          (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
    });

    final sortedEntries = groupedTransactions.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return Map<String, List<TransactionModel>>.fromEntries(sortedEntries);
  }

  int getWeekOfYear(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final daysSinceFirstDay = date.difference(firstDayOfYear).inDays;
    return (daysSinceFirstDay / 7).ceil();
  }

  Map<String, String> getDateRangeForWeek(int weekNumber, int year) {
    final firstDayOfYear = DateTime(year, 1, 1);
    final startOfWeek =
        firstDayOfYear.add(Duration(days: (weekNumber - 1) * 7));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final startFormat = DateFormat('d.MM').format(startOfWeek);
    final endFormat = DateFormat('d.MM').format(endOfWeek);

    return {'start': startFormat, 'end': endFormat};
  }

  Map<int, Map<String, dynamic>> groupTransactionsByWeek() {
    final Map<int, Map<String, dynamic>> weeklySummary = {};

    for (var transaction in transactions) {
      if (transaction.date.isEmpty) continue;

      final date = DateTime.parse(transaction.date);
      final weekOfYear = getWeekOfYear(date);

      if (!weeklySummary.containsKey(weekOfYear)) {
        final dateRange = getDateRangeForWeek(weekOfYear, date.year);
        weeklySummary[weekOfYear] = {
          'income': 0.0,
          'expense': 0.0,
          'dateRange': '${dateRange['start']} - ${dateRange['end']}',
        };
      }

      if (transaction.categoryType == 'Income') {
        weeklySummary[weekOfYear]!['income'] += transaction.amount;
      } else if (transaction.categoryType == 'Expense') {
        weeklySummary[weekOfYear]!['expense'] += transaction.amount.abs();
      }
    }

    return weeklySummary;
  }

  Map<String, Map<String, double>> groupTransactionsByMonth() {
    final Map<String, Map<String, double>> monthlySummary = {};

    for (var transaction in transactions) {
      if (transaction.date.isEmpty) continue;

      final date = DateTime.parse(transaction.date);
      final monthKey =
          DateFormat('MMMM yyyy').format(date);

      if (!monthlySummary.containsKey(monthKey)) {
        monthlySummary[monthKey] = {
          'income': 0.0,
          'expense': 0.0,
        };
      }

      final currentIncome = monthlySummary[monthKey]!['income'] ?? 0.0;
      final currentExpense = monthlySummary[monthKey]!['expense'] ?? 0.0;

      if (transaction.categoryType == 'Income') {
        monthlySummary[monthKey]!['income'] =
            currentIncome + transaction.amount;
      } else if (transaction.categoryType == 'Expense') {
        monthlySummary[monthKey]!['expense'] =
            currentExpense + transaction.amount.abs();
      }
    }

    return monthlySummary;
  }

  Map<int, Map<String, double>> groupTransactionsByYear() {
    final Map<int, Map<String, double>> yearlySummary = {};

    for (var transaction in transactions) {
      if (transaction.date.isEmpty) continue;

      final date = DateTime.parse(transaction.date);
      final year = date.year;

      if (!yearlySummary.containsKey(year)) {
        yearlySummary[year] = {
          'income': 0.0,
          'expense': 0.0,
        };
      }

      final currentIncome = yearlySummary[year]!['income'] ?? 0.0;
      final currentExpense = yearlySummary[year]!['expense'] ?? 0.0;

      if (transaction.categoryType == 'Income') {
        yearlySummary[year]!['income'] = currentIncome + transaction.amount;
      } else if (transaction.categoryType == 'Expense') {
        yearlySummary[year]!['expense'] =
            currentExpense + transaction.amount.abs();
      }
    }

    return yearlySummary;
  }


  void filterTransactions() {
    if (searchQuery.value.isEmpty) return;
    transactions.assignAll(
      transactions.where(
        (transaction) =>
            transaction.description
                .toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ||
            transaction.amount.toString().contains(searchQuery.value),
      ),
    );
  }
}
