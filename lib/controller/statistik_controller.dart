import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/category_model.dart';

class StatistikController extends GetxController {
  var isIncomeSelected = true.obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  var categoriesList = <CategoryModel>[].obs;

  void setIsIncomeSelected(bool value) {
    isIncomeSelected.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Ambil data Categories dari database
  Future<void> fetchCategories() async {
    try {
      final result = await _dbHelper.getCategories();
      categoriesList.assignAll(result);
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
}
