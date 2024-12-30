import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/models/setting_model.dart';

class SettingsController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  var userName = 'Loading...'.obs;

  Future<void> saveName(String name) async {
    if (name.trim().isEmpty) {
      Get.snackbar('Error', 'Nama tidak boleh kosong!');
      return;
    }

    try {
      await _dbHelper.insertSetting(SettingsModel(name: name.trim()));
      fetchUserName(); 
      Get.offNamed('/home');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menyimpan nama: $e');
      print(e);
    }
  }

  Future<void> fetchUserName() async {
    try {
      List<SettingsModel> settings = await _dbHelper.getSettings();
      if (settings.isNotEmpty) {
        userName.value = settings[0].name; 
      } else {
        userName.value = 'User'; 
      }
    } catch (e) {
      userName.value = 'Error';
      Get.snackbar('Error', 'Gagal mengambil nama: $e');
    }
  }

  
}
