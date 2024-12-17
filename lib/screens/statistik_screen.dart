import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/models/home/data_dummy.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/home/doughnut_chart_widget.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/header.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/tab_controller.dart';

class StatistikScreen extends StatelessWidget {
  const StatistikScreen({super.key});

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
              DoughnutChart(),
              const SizedBox(height: 32),
              Obx(() {
                final filteredCategories = categories
                    .where((category) => controller.isIncomeSelected.value
                        ? category["type"] == "Pemasukan"
                        : category["type"] == "Pengeluaran")
                    .toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = filteredCategories[index];
                    return CategoryCard(
                      title: category['title'],
                      amount: category['amount'],
                      percentage: category['percentage'],
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
