import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class HistoryController extends GetxController {
  // Observables
  var selectedFilter = "Hari".obs;
  var searchQuery = "".obs;
  var selectedMonth = ''.obs;
  var isAscending = false.obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var transactions = <TransactionModel>[].obs;
  var allTransactions = <TransactionModel>[].obs;
  var selectedCategory = Rxn<int>();

  // Database Helper
  final dbHelper = DatabaseHelper();

  // State Variables
  bool _isFetching = false;
  List<TransactionModel> _cachedTransactions = [];

  // Initialization
  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadAllTransactions().then((_) {
      if (selectedMonth.isNotEmpty) {
        filterTransactionsByMonth();
      }
    });

    debounce(selectedMonth, (_) {
      filterTransactionsByMonth();
    }, time: const Duration(milliseconds: 300));
  }

  // Filters
  void toggleSortOrder() {
    isAscending.value = !isAscending.value;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterTransactionsBySearchQuery();
  }

  void setSelectedMonth(String month) async {
    selectedMonth.value = month;

    if (transactions.isEmpty) {
      await loadAllTransactions();
    }

    filterTransactionsByMonth();
  }

  void setFilter(String filter) async {
    selectedFilter.value = filter;

    if (transactions.isEmpty) {
      await loadAllTransactions();
    }

    if (filter == "Hari" || filter == "Minggu") {
      filterTransactionsByMonth();
    } else {
      showAllTransactions();
    }
  }

  void resetSearchQuery() {
    searchQuery.value = "";
    loadAllTransactions();
  }

  void resetTransactions() {
    transactions.assignAll(allTransactions);
  }

  // Loaders
  Future<void> loadCategories() async {
    try {
      final fetchedCategories = await dbHelper.getCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  Future<void> loadAllTransactions() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final data = await dbHelper.getAllTransactions();
      allTransactions.assignAll(data);
      transactions.assignAll(data);
    } catch (e) {
      print('Error fetching transactions: $e');
    } finally {
      _isFetching = false;
    }
  }

  void showAllTransactions() {
    if (_cachedTransactions.isNotEmpty) {
      transactions.assignAll(_cachedTransactions);
    } else {
      loadAllTransactions();
    }
  }

  // Filters and Grouping Functions
  void filterTransactionsByCategory(int categoryId) {
    final filteredTransactions = allTransactions.where((transaction) {
      return transaction.categoryId == categoryId;
    }).toList();

    transactions.assignAll(filteredTransactions);
  }

  void filterTransactionsBySearchQuery() {
    if (searchQuery.value.isEmpty) {
      transactions.assignAll(allTransactions);
    } else {
      final filteredTransactions = allTransactions.where((transaction) {
        final description = transaction.description.toLowerCase();
        final query = searchQuery.value.toLowerCase();
        return description.contains(query);
      }).toList();

      transactions.assignAll(filteredTransactions);
    }
  }

  void filterTransactionsByMonth() {
    if (selectedMonth.isEmpty) {
      return;
    }

    if (transactions.isEmpty) {
      return;
    }

    final monthYear = selectedMonth.split(' ');
    if (monthYear.length < 2) {
      return;
    }

    final monthName = monthYear[0];
    final year = monthYear[1];

    final monthNumber =
        DateFormat('MMMM').parse(monthName).month.toString().padLeft(2, '0');

    final filtered = transactions.where((transaction) {
      final transactionDate = DateTime.tryParse(transaction.date);
      if (transactionDate == null) return false;

      final transactionMonth = DateFormat('MM').format(transactionDate);
      final transactionYear = DateFormat('yyyy').format(transactionDate);

      return transactionMonth == monthNumber && transactionYear == year;
    }).toList();

    transactions.assignAll(filtered);
  }

  // Grouping Functions
  Map<String, List<TransactionModel>> groupTransactionsByDay(
      {bool isAscending = false}) {
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
      value.sort((a, b) => isAscending
          ? DateTime.parse(a.date).compareTo(DateTime.parse(b.date))
          : DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
    });

    final sortedEntries = groupedTransactions.entries.toList()
      ..sort((a, b) =>
          isAscending ? a.key.compareTo(b.key) : b.key.compareTo(a.key));

    return Map<String, List<TransactionModel>>.fromEntries(sortedEntries);
  }

  int getWeekOfYear(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final daysSinceFirstDay = date.difference(firstDayOfYear).inDays;
    return (daysSinceFirstDay / 7).ceil() + 1;
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

  Map<int, Map<String, dynamic>> groupTransactionsByWeek(
      {bool isAscending = false}) {
    final Map<int, Map<String, dynamic>> weeklySummary = {};

    final filteredTransactions = transactions.where((transaction) {
      if (selectedMonth.isEmpty) return true;

      final monthYear = selectedMonth.split(' ');
      if (monthYear.length != 2) return true;

      final monthName = monthYear[0];
      final year = monthYear[1];
      final monthNumber =
          DateFormat('MMMM').parse(monthName).month.toString().padLeft(2, '0');

      final transactionDate = DateTime.tryParse(transaction.date);
      if (transactionDate == null) return false;

      final transactionMonth = DateFormat('MM').format(transactionDate);
      final transactionYear = DateFormat('yyyy').format(transactionDate);

      return transactionMonth == monthNumber && transactionYear == year;
    }).toList();

    for (var transaction in filteredTransactions) {
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

    final sortedEntries = weeklySummary.entries.toList()
      ..sort((a, b) =>
          isAscending ? a.key.compareTo(b.key) : b.key.compareTo(a.key));

    return Map<int, Map<String, dynamic>>.fromEntries(sortedEntries);
  }

  Map<String, Map<String, double>> groupTransactionsByMonth(
      {bool isAscending = false}) {
    final Map<String, Map<String, double>> monthlySummary = {};

    for (var transaction in transactions) {
      if (transaction.date.isEmpty) continue;

      final date = DateTime.parse(transaction.date);
      final monthKey = DateFormat('MMMM yyyy').format(date);

      if (!monthlySummary.containsKey(monthKey)) {
        monthlySummary[monthKey] = {
          'income': 0.0,
          'expense': 0.0,
        };
      }

      if (transaction.categoryType == 'Income') {
        monthlySummary.putIfAbsent(
            monthKey, () => {'income': 0.0, 'expense': 0.0});
        monthlySummary[monthKey]!['income'] =
            (monthlySummary[monthKey]!['income'] ?? 0.0) + transaction.amount;
      } else if (transaction.categoryType == 'Expense') {
        monthlySummary.putIfAbsent(
            monthKey, () => {'income': 0.0, 'expense': 0.0});
        monthlySummary[monthKey]!['expense'] =
            (monthlySummary[monthKey]!['expense'] ?? 0.0) +
                transaction.amount.abs();
      }
    }

    final sortedEntries = monthlySummary.entries.toList()
      ..sort((a, b) =>
          isAscending ? a.key.compareTo(b.key) : b.key.compareTo(a.key));

    return Map<String, Map<String, double>>.fromEntries(sortedEntries);
  }

  Map<int, Map<String, double>> groupTransactionsByYear(
      {bool isAscending = false}) {
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

      if (transaction.categoryType == 'Income') {
        yearlySummary.putIfAbsent(year, () => {'income': 0.0, 'expense': 0.0});
        yearlySummary[year]!['income'] =
            (yearlySummary[year]!['income'] ?? 0.0) + transaction.amount;
      } else if (transaction.categoryType == 'Expense') {
        yearlySummary.putIfAbsent(year, () => {'income': 0.0, 'expense': 0.0});
        yearlySummary[year]!['expense'] =
            (yearlySummary[year]!['expense'] ?? 0.0) + transaction.amount.abs();
      }
    }

    final sortedEntries = yearlySummary.entries.toList()
      ..sort((a, b) =>
          isAscending ? a.key.compareTo(b.key) : b.key.compareTo(a.key));

    return Map<int, Map<String, double>>.fromEntries(sortedEntries);
  }
}
