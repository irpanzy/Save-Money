import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/input_controller.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';

class InputCategoryController extends GetxController {
  final dbHelper = DatabaseHelper();

  var isIncome = true.obs;

  final titleController = TextEditingController();

  var titleError = ''.obs;

  void setIsIncome(bool value) {
    isIncome.value = value;
  }

  Future<void> saveCategory() async {
    titleError.value = '';

    if (titleController.text.isEmpty) {
      titleError.value = 'Nama kategori harus diisi';
      return;
    }

    final newCategory = CategoryModel(
      title: titleController.text,
      type: isIncome.value ? 'Income' : 'Expense',
    );

    try {
      await dbHelper.insertCategory(newCategory);

      // Update daftar kategori di InputController
      final InputController inputController = Get.find<InputController>();
      inputController
          .loadCategories(); // Memuat ulang kategori di input transaksi

      // Update daftar kategori di StatistikController
      final StatistikController statistikController =
          Get.find<StatistikController>();
      statistikController
          .fetchCategories(); // Memuat ulang kategori di statistik

      Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFCCCCCC),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, size: 50, color: Colors.green),
                const SizedBox(height: 16),
                const Text(
                  'Kategori berhasil disimpan.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.toNamed('/statistik');
                    resetForm();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal menyimpan kategori');
    }
  }

  void resetForm() {
    titleController.clear();
  }
}
