import 'package:get/get.dart';

class StatistikController extends GetxController {
  var isIncomeSelected = true.obs;

  void setIsIncomeSelected(bool value) {
    isIncomeSelected.value = value;
  }
}
