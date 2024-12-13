import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/helpers/navigation_helper.dart';
import 'package:project_apk_catatan_keuangan/models/home/data_dummy.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/home/doughnut_chart_widget.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/header.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/tab_controller.dart';

class StatistikScreen extends StatefulWidget {
  const StatistikScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatistikScreenState createState() => _StatistikScreenState();
}

class _StatistikScreenState extends State<StatistikScreen> {
  bool isIncomeSelected = true;
  int _currentIndex = 3;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories
        .where((category) => isIncomeSelected
            ? category["type"] == "Pemasukan"
            : category["type"] == "Pengeluaran")
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              const Header(),
              const SizedBox(height: 24),
              TabButton(
                isIncomeSelected: isIncomeSelected,
                onTabChanged: (bool value) {
                  setState(() {
                    isIncomeSelected = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              DoughnutChart(),
              const SizedBox(height: 32),
              ListView.builder(
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
                    isIncomeSelected: isIncomeSelected,
                  );
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
          BottomNavbar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}
