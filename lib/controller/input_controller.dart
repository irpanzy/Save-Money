import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';

class InputController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadCategories();
    ever(isIncome, (_) {
      resetForm();
      filterCategories();
    });

    _setupAmountListener();
  }

  final dbHelper = DatabaseHelper();
  var isIncome = true.obs;

  final dateController = TextEditingController();
  final amountController = TextEditingController();
  final deskripsiController = TextEditingController();

  var categories = <CategoryModel>[].obs;
  var filteredCategories = <CategoryModel>[].obs;
  var selectedCategoryId = Rxn<int>();

  void setIsIncome(bool value) {
    isIncome.value = value;
  }

  final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);

  void _setupAmountListener() {
    amountController.addListener(() {
      final text = amountController.text.replaceAll(RegExp(r'[^\d]'), '');
      if (text.isEmpty) {
        amountController.value = amountController.value.copyWith(
          text: '',
          selection: const TextSelection.collapsed(offset: 0),
        );
        return;
      }

      final formattedText = _currencyFormat.format(int.parse(text));
      amountController.value = amountController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

  Future<void> loadCategories() async {
    final fetchedCategories = await dbHelper.getCategories();
    categories.assignAll(fetchedCategories);
  }

  void filterCategories() {
    filteredCategories.assignAll(
      categories.where((category) => isIncome.value
          ? category.type == 'Income'
          : category.type == 'Expense'),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> saveTransaction() async {
    if (selectedCategoryId.value == null) {
      Get.snackbar('Error', 'Pilih kategori terlebih dahulu');
      return;
    }

    final rawAmount =
        amountController.text.replaceAll('.', '').replaceAll(',', '');

    final transaction = TransactionModel(
      amount: double.tryParse(rawAmount) ?? 0,
      description: deskripsiController.text,
      date: dateController.text,
      categoryId: selectedCategoryId.value!,
    );

    try {
      await dbHelper.insertTransaction(transaction);
      final HomescreenController homeController =
          Get.find<HomescreenController>();

      homeController.fetchLargestExpenses();
      homeController.calculateSaldo();
      homeController.calculateIncomeMounth();
      homeController.calculateExpenseMount();

      final HistoryController historyController = Get.find<HistoryController>();
      await historyController.loadAllTransactions();

      Get.dialog(AlertDialog(
        title: const Text('Berhasil!',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Transaksi berhasil disimpan.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed('/history');
              resetForm();
            },
            child: const Text('OK'),
          ),
        ],
      ));
    } catch (e) {
      Get.snackbar('Error', 'Gagal menyimpan transaksi');
    }
  }

  void resetForm() {
    dateController.clear();
    amountController.clear();
    deskripsiController.clear();
    selectedCategoryId.value = null;
  }
}
