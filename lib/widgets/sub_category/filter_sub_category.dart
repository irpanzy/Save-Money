import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/sub_category_controller.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class FilterSubCategory extends StatelessWidget {
  const FilterSubCategory({
    super.key,
    required this.categoryId,
    required this.categoryType,
    required this.transactionCount,
  });
  final int categoryId;
  final String categoryType;
  final int transactionCount;

  @override
  Widget build(BuildContext context) {
    final SubCategoryController controller = Get.put(SubCategoryController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: categoryType == 'Income'
                  ? ColorStyle.primaryColor50
                  : ColorStyle.secondaryColor50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('$transactionCount Transaksi',
                style: TypographyStyle.p1Bold.copyWith(
                  color: categoryType == 'Income' ? Colors.black : Colors.white,
                )),
          ),
          Spacer(),
          Obx(() {
            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller
                    .sortOption.value, // Gunakan nilai reaktif dari controller
                items: [
                  DropdownMenuItem(
                    value: 'Terbaru',
                    child: Text(
                      'Terbaru',
                      style: TypographyStyle.l1Regular,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Terlama',
                    child: Text(
                      'Terlama',
                      style: TypographyStyle.l1Regular,
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    controller.sortOption.value =
                        value; // Perbarui nilai di controller
                    controller.sortTransactions(); // Terapkan sorting
                  }
                },
                icon: const Icon(
                  Symbols.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 16,
                  weight: 600,
                ),
                dropdownColor: Colors.white,
                alignment: Alignment.center,
              ),
            );
          }),

        ],
      ),
    );
  }
}
