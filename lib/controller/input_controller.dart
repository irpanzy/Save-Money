import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';

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
    Get.lazyPut(() => StatistikController());
  }

  @override
  void onReady() {
    super.onReady();
    filterCategories();
  }

  final dbHelper = DatabaseHelper();
  var isIncome = true.obs;

  var dateError = ''.obs;
  var categoryError = ''.obs;
  var amountError = ''.obs;
  var descriptionError = ''.obs;

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
    try {
      final fetchedCategories = await dbHelper.getCategories();
      categories.assignAll(fetchedCategories);
      filterCategories();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat kategori');
    }
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
    dateError.value = '';
    categoryError.value = '';
    amountError.value = '';
    descriptionError.value = '';

    bool isValid = true;

    if (dateController.text.isEmpty) {
      dateError.value = 'Tanggal harus diisi';
      isValid = false;
    }

    if (selectedCategoryId.value == null) {
      categoryError.value = 'Kategori harus dipilih';
      isValid = false;
    }

    if (amountController.text.isEmpty) {
      amountError.value = 'Jumlah harus diisi';
      isValid = false;
    }

    if (deskripsiController.text.isEmpty) {
      descriptionError.value = 'Keterangan harus diisi';
      isValid = false;
    }

    if (!isValid) return;

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

      final StatistikController statisticController =
          Get.find<StatistikController>();

      final historyController = Get.put(HistoryController());

      homeController.fetchLargestExpenses();
      homeController.calculateSaldo();
      homeController.calculateIncomeMounth();
      homeController.calculateExpenseMount();
      await statisticController.fetchAvailableMonths();

      await historyController.loadAllTransactions();

      Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorStyle.borderBlackLow,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Symbols.check_circle,
                      color: Colors.black87,
                      size: 28,
                      weight: 600,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Berhasil!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Transaksi berhasil disimpan.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/history');
                      resetForm();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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
