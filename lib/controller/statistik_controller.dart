import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class StatistikController extends GetxController {
  var isIncomeSelected = true.obs;
  var categoriesList = <CategoryModel>[].obs;
  var transactions = <TransactionModel>[].obs;
  var availableMonths = <String>[].obs;
  var selectedMonth = ''.obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  final DatabaseHelper _dbHelper = DatabaseHelper();
  void setIsIncomeSelected(bool value) {
    isIncomeSelected.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchTransactions();
    fetchAvailableMonths();
  }

  Future<void> fetchAvailableMonths() async {
    try {
      final months = await dbHelper.getAvailableMonths();
      if (months.isNotEmpty) {
        availableMonths.assignAll(months);

        if (selectedMonth.value.isEmpty) {
          selectedMonth.value = months.first;
        }
      }
    } catch (e) {
      print('Error fetching available months: $e');
    }
  }

  void setSelectedMonth(String month) {
    if (!availableMonths.contains(month)) {
      return;
    }

    selectedMonth.value = month;

    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    try {
      final result = await _dbHelper.getAllTransactions();
      transactions.assignAll(result);

      if (selectedMonth.isNotEmpty) {
        final filtered = transactions.where((transaction) {
          final date = transaction.date;

          // ignore: unnecessary_null_comparison
          if (date == null || date.isEmpty || date.length < 10) {
            return false;
          }

          final transactionMonth =
              DateFormat('MMMM yyyy').format(DateTime.parse(date));

          return transactionMonth == selectedMonth.value;
        }).toList();

        transactions.assignAll(filtered);
      }
    } catch (e) {
      print('Error fetching transactions: $e');
    }
  }

  Future<void> fetchCategories() async {
    try {
      final result = await _dbHelper.getCategories();
      categoriesList.assignAll(result);
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  List<TransactionModel> get filteredTransactions {
    final filtered = transactions.where((transaction) {
      final date = transaction.date;

      // ignore: unnecessary_null_comparison
      if (date == null || date.isEmpty || date.length < 10) {
        return false;
      }

      final transactionMonth =
          DateFormat('MMMM yyyy').format(DateTime.parse(date));

      return transactionMonth == selectedMonth.value;
    }).toList();

    return filtered;
  }

  Map<String, Map<String, dynamic>> calculateCategoryStats(
      String categoryType) {
    final Map<String, Map<String, dynamic>> categoryStats = {};
    final filteredTransactions = this.filteredTransactions;

    // Ambil semua kategori berdasarkan jenis
    final allCategories =
        categoriesList.where((category) => category.type == categoryType);

    // Hitung total transaksi
    double totalAmount = 0.0;
    for (var transaction in filteredTransactions) {
      if (transaction.categoryType != categoryType) continue;

      final category = transaction.categoryTitle ?? "Unknown";

      if (!categoryStats.containsKey(category)) {
        categoryStats[category] = {
          'totalAmount': 0.0,
          'type': transaction.categoryType,
        };
      }

      categoryStats[category]!['totalAmount'] += transaction.amount;
      totalAmount += transaction.amount.abs();
    }

    // Tambahkan kategori dengan totalAmount 0 jika belum ada transaksi
    for (var category in allCategories) {
      if (!categoryStats.containsKey(category.title)) {
        categoryStats[category.title] = {
          'totalAmount': 0.0,
          'type': categoryType,
        };
      }
    }

    // Hitung persentase per kategori
    categoryStats.forEach((key, value) {
      value['percentage'] = totalAmount == 0
          ? 0
          : ((value['totalAmount'] / totalAmount) * 100).round();
    });

    return categoryStats;
  }
}
