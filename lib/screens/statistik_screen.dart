import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/doughnut_category_chart.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/header.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/header_row.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/tab_controller.dart';

class StatistikScreen extends StatefulWidget {
  const StatistikScreen({super.key});

  @override
  State<StatistikScreen> createState() => _StatistikScreenState();
}

class _StatistikScreenState extends State<StatistikScreen> {
  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              const Header(),
              const SizedBox(height: 24),
              TabButton(),
              const SizedBox(height: 32),
              Obx(() {
                return DoughnutChart(
                  isIncomeSelected: controller.isIncomeSelected.value,
                );
              }),
              const SizedBox(height: 32),
              HeaderRow(),
              const SizedBox(height: 16),
              Obx(() {
                final categoryType =
                    controller.isIncomeSelected.value ? "Income" : "Expense";

                final categoryStats =
                    controller.calculateCategoryStats(categoryType);
                final filteredCategories = categoryStats.entries.toList();

                if (filteredCategories.isEmpty) {
                  return Center(
                      child: Text("Tidak ada data kategori di bulan ini"));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) {
                    final entry = filteredCategories[index];
                    return CategoryCard(
                      title: entry.key,
                      amount: CurrencyHelper.formatSaldoRupiah(
                          entry.value['totalAmount']),
                      percentage: entry.value['percentage'],
                    );
                  },
                );
              }),
              const SizedBox(height: 88),
            ],
          ),
          BottomNavbar(
            currentIndex: 3,
          ),
        ],
      ),
    );
  }
}
