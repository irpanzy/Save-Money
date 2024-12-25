import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class HomescreenController extends GetxController {
  final _dbHelper = DatabaseHelper();
  var largestExpenses = <TransactionModel>[].obs;
  var saldo = 0.0.obs;
  var income = 0.0.obs;
  var expense = 0.0.obs;

  Future<void> fetchLargestExpenses() async {
    try {
      final expenses = await _dbHelper.getLargestExpensesForCurrentMonth();
      largestExpenses.assignAll(expenses);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat pengeluaran terbesar: $e');
    }
  }

  Future<void> calculateSaldo() async {
    try {
      final totalIncome = await _dbHelper.getTotalIncome();
      final totalExpense = await _dbHelper.getTotalExpense();
      saldo.value = totalIncome - totalExpense;
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghitung saldo: $e');
    }
  }

  Future<void> calculateIncomeMounth() async {
    try {
      final totalIncome = await _dbHelper.getTotalIncomeMounth();
      income.value = totalIncome;
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghitung Income: $e');
    }
  }

  Future<void> calculateExpenseMount() async {
    try {
      final totalExpense = await _dbHelper.getTotalExpenseMounth();
      expense.value = totalExpense;
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghitung Expense: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchLargestExpenses();
    calculateSaldo();
    calculateIncomeMounth();
    calculateExpenseMount();
  }
}
