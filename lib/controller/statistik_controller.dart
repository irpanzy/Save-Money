import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
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

    fetchAvailableMonths().then((_) {
      if (availableMonths.isNotEmpty && selectedMonth.isEmpty) {
        selectedMonth.value = availableMonths.first;
        
        final historyController = Get.find<HistoryController>();
        historyController.setSelectedMonth(selectedMonth.value);
      }
    });
  }

  Future<void> fetchAvailableMonths() async {
    try {
      final months = await dbHelper.getAvailableMonths();
      availableMonths.assignAll(months);

      if (selectedMonth.value.isEmpty && months.isNotEmpty) {
        selectedMonth.value = months.first;
      }
    } catch (e) {
      print('Error fetching available months: $e');
    }
  }

  void setSelectedMonth(String month) {
    print("StatistikController: Selected month set to $month");
    selectedMonth.value = month;

    // Pastikan HistoryController juga diperbarui
    final historyController = Get.find<HistoryController>();
    historyController.setSelectedMonth(month);
  }


  Future<void> fetchTransactions() async {
    try {
      final result = await _dbHelper.getAllTransactions();
      transactions.assignAll(result);
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

  Map<String, Map<String, dynamic>> calculateCategoryStats(
      String categoryType) {
    final Map<String, Map<String, dynamic>> categoryStats = {};

    double totalAmount = 0.0;

    for (var transaction in transactions) {
      if (transaction.categoryType != categoryType) {
        continue;
      }

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

    categoryStats.forEach((key, value) {
      value['percentage'] = totalAmount == 0
          ? 0
          : ((value['totalAmount'] / totalAmount) * 100).round();
    });

    return categoryStats;
  }
}
