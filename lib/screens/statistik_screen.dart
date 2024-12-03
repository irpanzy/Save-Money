import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/helpers/navigation_helper.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/home/doughnut_chart_widget.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/mount_dropdown.dart';

class StatistikScreen extends StatefulWidget {
  const StatistikScreen({super.key});

  @override
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Symbols.arrow_back_rounded,
                        color: Colors.black,
                        size: 24,
                        weight: 600,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Statistik',
                      style: TypographyStyle.h4,
                    ),
                    const Spacer(),
                    const MonthSelector(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncomeSelected = true;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            'Pemasukan',
                            style: TypographyStyle.h5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (isIncomeSelected)
                          Container(
                            height: 2,
                            width: 120,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncomeSelected = false;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            'Pengeluaran',
                            style: TypographyStyle.h5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (!isIncomeSelected)
                          Container(
                            height: 2,
                            width: 120,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              DoughnutChart(),
              const SizedBox(height: 32),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: isIncomeSelected
                    ? _buildIncomeCategoryList()
                    : _buildExpenseCategoryList(),
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

  List<Widget> _buildIncomeCategoryList() {
    return [
      CategoryCard(
        title: 'Gajihan',
        percentage: 52,
        amount: '200.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Bonus THR',
        percentage: 25,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Freelance',
        percentage: 12,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Olshop',
        percentage: 5,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Olshop',
        percentage: 5,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Olshop',
        percentage: 5,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Olshop',
        percentage: 5,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
    ];
  }

  List<Widget> _buildExpenseCategoryList() {
    return [
      CategoryCard(
        title: 'Makanan',
        percentage: 40,
        amount: '920.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
      CategoryCard(
        title: 'Fashion',
        percentage: 40,
        amount: '220.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
    ];
  }
}
