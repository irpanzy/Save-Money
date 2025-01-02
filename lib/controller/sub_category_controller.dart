import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class SubCategoryController extends GetxController {
  final dbHelper = DatabaseHelper();
  var transactions = <TransactionModel>[].obs;
  var groupedTransactionsByDay = <String, List<TransactionModel>>{}.obs;
  var totalTransactions = 0.0.obs;
  var transactionCount = 0.obs;
  var allTransactions = <TransactionModel>[].obs;
  var availableMonths = <String>[].obs;
  var selectedMonth = ''.obs;
  var sortOption = 'Terbaru'.obs;
  var chartData = <Map<String, dynamic>>[].obs;
  var filteredChartData = <Map<String, dynamic>>[].obs;
  var isFilteredByMonth = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    final int categoryId = arguments['categoryId'];
    fetchTransactionsByCategory(categoryId);
    sortOption.value = 'Terbaru';

    fetchAvailableMonths();
    fetchTransactionsByCategory(categoryId);
  }

  void prepareChartData(int categoryId) {
    // Reset status filter
    isFilteredByMonth.value = selectedMonth.value != 'All Transactions';

    // Filter transaksi berdasarkan kategori
    final filteredTransactions = allTransactions.where((transaction) {
      return transaction.categoryId == categoryId;
    }).toList();

    // Jika filter bulan aktif, filter data berdasarkan bulan
    if (isFilteredByMonth.value) {
      final DateFormat format = DateFormat('MMMM yyyy');
      final DateTime selectedDate = format.parse(selectedMonth.value);

      filteredTransactions.retainWhere((transaction) {
        final transactionDate = DateTime.parse(transaction.date);
        return transactionDate.month == selectedDate.month &&
            transactionDate.year == selectedDate.year;
      });
    }

    // Kelompokkan data berdasarkan mode tampilan
    final Map<String, double> groupedData = {};

    if (isFilteredByMonth.value) {
      // Mode filter bulan: Kelompokkan berdasarkan tanggal
      for (var transaction in filteredTransactions) {
        final DateTime transactionDate = DateTime.parse(transaction.date);
        final String day = transactionDate.day.toString(); // Gunakan tanggal

        if (groupedData.containsKey(day)) {
          groupedData[day] = groupedData[day]! + transaction.amount;
        } else {
          groupedData[day] = transaction.amount;
        }
      }
    } else {
      // Mode default: Kelompokkan berdasarkan bulan
      for (var transaction in filteredTransactions) {
        final DateTime transactionDate = DateTime.parse(transaction.date);
        final String month =
            DateFormat('MMM').format(transactionDate); // Gunakan bulan

        if (groupedData.containsKey(month)) {
          groupedData[month] = groupedData[month]! + transaction.amount;
        } else {
          groupedData[month] = transaction.amount;
        }
      }
    }

    // Konversi data menjadi format untuk chart
    filteredChartData.assignAll(
      groupedData.entries.map((entry) {
        return {'monthOrDay': entry.key, 'value': entry.value};
      }).toList(),
    );
  }

  void sortTransactions() {
    if (sortOption.value == 'Terbaru') {
      // Sorting dari data terbaru ke terlama
      transactions.sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);
        return dateB.compareTo(dateA);
      });
    } else if (sortOption.value == 'Terlama') {
      // Sorting dari data terlama ke terbaru
      transactions.sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);
        return dateA.compareTo(dateB);
      });
    }

    groupTransactionsByDay();
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

    // Dapatkan categoryId dari argumen
    final arguments = Get.arguments as Map<String, dynamic>;
    final int categoryId = arguments['categoryId'];

    if (month == 'All Transactions') {
      transactions.assignAll(allTransactions); // Tampilkan semua data
    } else {
      fetchTransactionsForSelectedMonth(categoryId); // Filter berdasarkan bulan
    }

    prepareChartData(categoryId); // Perbarui data untuk chart
  }

  Future<void> fetchTransactionsForSelectedMonth(int categoryId) async {
    try {
      if (selectedMonth.isNotEmpty) {
        final DateFormat format = DateFormat('MMMM yyyy');
        final DateTime selectedDate = format.parse(selectedMonth.value);

        final filtered = allTransactions.where((transaction) {
          final transactionDate = DateTime.parse(transaction.date);

          return transaction.categoryId == categoryId &&
              transactionDate.month == selectedDate.month &&
              transactionDate.year == selectedDate.year;
        }).toList();

        transactions.assignAll(filtered);

        // Terapkan sorting
        sortTransactions();

        updateTransactionCount();
        groupTransactionsByDay();
      }
    } catch (e) {
      print('Error fetching transactions for selected month: $e');
    }
  }

  void updateTransactionCount() {
    transactionCount.value = transactions.length;
  }

  Future<void> fetchTransactionsByCategory(int categoryId) async {
    try {
      final transactionsFromDb = await dbHelper.getAllTransactions();

      // Simpan semua transaksi asli
      allTransactions.assignAll(transactionsFromDb);

      // Filter transaksi berdasarkan kategori
      final filteredTransactions = transactionsFromDb.where((transaction) {
        return transaction.categoryId == categoryId;
      }).toList();

      transactions.assignAll(filteredTransactions);

      totalTransactions.value = calculateTotalTransactions(categoryId);
      updateTransactionCount();
      groupTransactionsByDay();

      // Persiapkan data untuk chart
      prepareChartData(categoryId);
    } catch (e) {
      print('Error fetching transactions: $e');
    }
  }

  void groupTransactionsByDay() {
    final Map<String, List<TransactionModel>> grouped = {};
    for (var transaction in transactions) {
      if (transaction.date.isEmpty) continue;

      final dateKey =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction.date));
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(transaction);
    }

    groupedTransactionsByDay.assignAll(grouped);
  }

  double calculateTotalTransactions(int categoryId) {
    double total = 0.0;

    final DateTime now = DateTime.now();
    final int currentMonth = now.month;
    final int currentYear = now.year;

    for (var transaction in transactions) {
      if (transaction.categoryId == categoryId) {
        final DateTime transactionDate = DateTime.parse(transaction.date);

        if (transactionDate.month == currentMonth &&
            transactionDate.year == currentYear) {
          total += transaction.amount;
        }
      }
    }

    return total;
  }
}
