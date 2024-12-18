import 'package:get/get.dart';

class InputController extends GetxController {
  var isIncome = true.obs;

  void setIsIncome(bool value) {
    isIncome.value = value;
  }
}