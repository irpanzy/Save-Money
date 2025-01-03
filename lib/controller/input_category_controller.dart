import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/core.dart';
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

    if (titleController.text.trim().isEmpty) {
      titleError.value = 'Nama kategori harus diisi';
      return;
    }

    final newCategory = CategoryModel(
      title: titleController.text.trim(),
      type: isIncome.value ? 'Income' : 'Expense',
    );

    try {
      await dbHelper.insertCategory(newCategory);

      titleController.clear();
      isIncome.value = true;

      if (Get.isRegistered<InputController>()) {
        await Get.find<InputController>().loadCategories();
      } else {
        Get.put(InputController()).loadCategories();
      }

      if (Get.isRegistered<StatistikController>()) {
        await Get.find<StatistikController>().fetchCategories();
      } else {
        Get.put(StatistikController()).fetchCategories();
      }

      if (Get.isRegistered<HistoryController>()) {
        await Get.find<HistoryController>().loadCategories();
      } else {
        Get.put(HistoryController()).loadCategories();
      }

      Get.back();
      Get.snackbar(
        'Sukses',
        'Kategori berhasil disimpan',
        backgroundColor: ColorStyle.primaryColor60,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menyimpan kategori',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetForm() {
    titleController.clear();
  }
}
