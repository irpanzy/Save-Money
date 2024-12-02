import 'package:flutter/material.dart';

import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/home/doughnut_chart_home.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  bool isIncomeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
            // Title (text)
            Text(
              'Statistik',
              style: TypographyStyle.h4,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8.0))
                  .copyWith(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Text(
                'May 2024 >',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Membungkus seluruh body dengan SingleChildScrollView
        child: Column(
          children: [
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
                      Text(
                        'Pemasukan',
                        style: TypographyStyle.h5,
                      ),
                      if (isIncomeSelected)
                        Container(
                          height: 2,
                          width: 120,
                          color: Colors.black,
                        )
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
                      Text(
                        'Pengeluaran',
                        style: TypographyStyle.h5,
                      ),
                      if (!isIncomeSelected)
                        Container(
                          height: 2,
                          width: 120,
                          color: Colors.black,
                        )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            DoughnutChart(),
            const SizedBox(height: 30),
            // Expanded tidak diperlukan di sini karena SingleChildScrollView sudah menangani scroll
            // Anda bisa langsung menggunakan ListView tanpa Expanded
            ListView(
              shrinkWrap:
                  true, // Membuat ListView memiliki ukuran yang sesuai dengan konten
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              children: isIncomeSelected
                  ? _buildIncomeCategoryList()
                  : _buildExpenseCategoryList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(context),
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
      CategoryCard(
        title: 'Motor',
        percentage: 20,
        amount: '120.000 IDR',
        isIncomeSelected: isIncomeSelected,
      ),
    ];
  }
}
