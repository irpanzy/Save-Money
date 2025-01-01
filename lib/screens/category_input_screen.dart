import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/input_category_controller.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/input/toggle_income_expense_widget.dart';

class InputCategoryScreen extends StatelessWidget {
  const InputCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InputCategoryController controller =
        Get.put(InputCategoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Buat Kategori', style: TypographyStyle.h4),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_rounded,
              weight: 600, color: Colors.black),
          onPressed: () => Get.toNamed('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: SizedBox(
            width: 425,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleIncomeExpenseWidget(
                  controller: controller,
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: controller.titleController,
                  style: TypographyStyle.l2Regular,
                  decoration: InputDecoration(
                    labelText: 'Nama Kategori',
                    labelStyle: TypographyStyle.l2Regular,
                    floatingLabelStyle: TypographyStyle.l2Regular.copyWith(
                      color: ColorStyle.primaryTextBlack,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorStyle.borderBlackActive, width: 3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                Obx(() => controller.titleError.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          controller.titleError.value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink()),
                const SizedBox(height: 24),
                Obx(() => Center(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.saveCategory();
                        },
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
