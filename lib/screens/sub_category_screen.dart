import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/sub_category_controller.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/filter_sub_category.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/header_subcategory.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/sub_category_chart.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/total_summary_sub_category.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/transaction_sub_category.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final String categoryType = arguments['categoryType'];
    final String categoryTitle = arguments['categoryTitle'];
    final int categoryId = arguments['categoryId'];

    final SubCategoryController controller = Get.put(SubCategoryController());
    controller.fetchTransactionsByCategory(categoryId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              HeaderSubCategory(title: categoryTitle),
              const SizedBox(height: 16),
              SubCategoryChart(categoryId: categoryId, categoryType: categoryType,
              ),
              const SizedBox(height: 40),
              Obx(() {
                return FilterSubCategory(
                  categoryId: categoryId,
                  categoryType: categoryType,
                  transactionCount: controller.transactionCount.value,
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                if (controller.groupedTransactionsByDay.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada transaksi untuk kategori ini."),
                  );
                }

                return Column(
                  children:
                      controller.groupedTransactionsByDay.entries.map((entry) {
                    return TransactionSubCategory(
                        date: entry.key,
                        transactions: entry.value,
                        categoryType: categoryType);
                  }).toList(),
                );
              }),
              const SizedBox(height: 80),
            ],
          ),
          TotalSummarySubCategory(
            categoryId: categoryId,
            title: categoryTitle,
            categoryType: categoryType,
          ),
        ],
      ),
    );
  }
}
