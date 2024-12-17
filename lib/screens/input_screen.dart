import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../widgets/input/input_form_widget.dart';
import '../widgets/input/toggle_income_expense_widget.dart';
import '../controller/input_controller.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InputController controller = Get.put(InputController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Buat Transaksi', style: TypographyStyle.h4),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_rounded,
              weight: 600, color: Colors.black),
          onPressed: () => Get.toNamed('/home'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Symbols.delete, color: ColorStyle.secondaryColor50),
              onPressed: () {
                Get.toNamed('/history');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: SizedBox(
            width: 425,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleIncomeExpenseWidget(),
                const SizedBox(height: 32),
                Obx(() => InputFormWidget(isIncome: controller.isIncome.value)),
                const SizedBox(height: 24),
                Obx(() => Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isIncome.value
                              ? ColorStyle.primaryColor60
                              : ColorStyle.secondaryColor50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Simpan',
                          style:
                              TypographyStyle.h4.copyWith(color: Colors.white),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
