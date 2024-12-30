// Imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import '../models/transaction_models.dart';
import '../helpers/db_helper.dart';

// Controller Class
class UpdateTransactionController extends GetxController {
  // Initialization
  @override
  void onInit() {
    super.onInit();

    final transaction = Get.arguments as TransactionModel?;
    if (transaction != null) {
      populateTransaction(transaction); 
    }

    amountController.addListener(() {
      final text = amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
      if (text.isNotEmpty) {
        final formatted = CurrencyHelper.formatSaldoRupiah(double.parse(text));
        amountController.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.collapsed(offset: formatted.length),
        );
      }
    });

    loadCategories();
  }

  // Reactive Variables
  RxBool isIncome = true.obs;
  var selectedCategoryId = Rxn<int>();
  RxList<CategoryModel> filteredCategories = <CategoryModel>[].obs;

  // Text Editing Controllers
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  // Error Messages
  var dateError = ''.obs;
  var categoryError = ''.obs;
  var descriptionError = ''.obs;
  var amountError = ''.obs;

  // Data Management
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  int? transactionId;
  final dbHelper = DatabaseHelper();

  // State Update Methods
  void setIsIncome(bool value) {
    isIncome.value = value;
    filterCategoriesByType();

    if (selectedCategoryId.value != null &&
        !filteredCategories
            .any((category) => category.id == selectedCategoryId.value)) {
      selectedCategoryId.value = null;
    }
  }

  // Transaction Population
  void populateTransaction(TransactionModel transaction) {
    resetForm();

    transactionId = transaction.id;
    isIncome.value = transaction.categoryType == "Income";
    filterCategoriesByType();
    selectedCategoryId.value = transaction.categoryId;
    amountController.text =
        CurrencyHelper.formatSaldoRupiah(transaction.amount);
    dateController.text = transaction.date;
    deskripsiController.text = transaction.description;

    update();
  }

  // Reset Form
  void resetForm() {
    transactionId = null;
    isIncome.value = true;
    selectedCategoryId.value = null;
    amountController.clear();
    dateController.clear();
    deskripsiController.clear();
  }

  // Filter Categories
  void filterCategoriesByType() {
    final filtered = allCategories
        .where((category) =>
            category.type == (isIncome.value ? 'Income' : 'Expense'))
        .toList();
    filteredCategories.assignAll(filtered);

    if (selectedCategoryId.value != null &&
        !filtered.any((category) => category.id == selectedCategoryId.value)) {
      selectedCategoryId.value = null;
    }
  }

  // **Update Transaction**
  Future<void> updateTransaction() async {
    if (dateController.text.isEmpty) {
      dateError.value = "Tanggal tidak boleh kosong.";
      return;
    }
    if (selectedCategoryId.value == null) {
      categoryError.value = "Kategori harus dipilih.";
      return;
    }
    if (amountController.text.isEmpty) {
      dateError.value = "Jumlah tidak boleh kosong.";
      return;
    }

    final transaction = TransactionModel(
      id: transactionId,
      amount: double.tryParse(
              amountController.text.replaceAll(RegExp(r'[^0-9]'), '')) ??
          0.0,
      description: deskripsiController.text,
      date: dateController.text,
      categoryId: selectedCategoryId.value!,
      categoryType: isIncome.value ? 'Income' : 'Expense',
    );

    try {
      await dbHelper.updateTransaction(transaction);
      final HistoryController historyController = Get.find<HistoryController>();
      historyController.loadAllTransactions();

      Get.toNamed('/history');
    } catch (e) {
      print("Error updating transaction: $e");
    }
  }

  // **Load Categories**
  Future<void> loadCategories() async {
    try {
      final categories = await dbHelper.getCategories();
      allCategories.assignAll(categories);
      filterCategoriesByType();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  // **Select Date**
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      dateController.text = picked.toIso8601String().split('T')[0];
    }
  }
}
