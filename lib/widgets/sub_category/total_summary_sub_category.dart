import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/sub_category_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TotalSummarySubCategory extends StatelessWidget {
  const TotalSummarySubCategory(
      {required this.categoryId,
      required this.title,
      required this.categoryType,
      super.key});

  final int categoryId;
  final String title;
  final String categoryType;

  @override
  Widget build(BuildContext context) {
    final SubCategoryController controller = Get.find<SubCategoryController>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: categoryType == 'Income'
              ? ColorStyle.primaryColor50
              : ColorStyle.secondaryColor50,
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total kategori $title Bulan Ini',
              style: TypographyStyle.l3Regular.copyWith(
                color: categoryType == 'Income' ? Colors.black : Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 4),
            Obx(() {
              return Text(
                CurrencyHelper.formatRupiah(controller.totalTransactions.value),
                style: TypographyStyle.h3.copyWith(
                  color: categoryType == 'Income' ? Colors.black : Colors.white,
                ),
                textAlign: TextAlign.left,
              );
            }),
          ],
        ),
      ),
    );
  }
}
