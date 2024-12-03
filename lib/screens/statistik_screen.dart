import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/helpers/navigation_helper.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/bottom_navbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/home/doughnut_chart_widget.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/category_card.dart';

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
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Statistik',
                      style: TypographyStyle.h4,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Menambahkan border radius 8px
                        ),
                      ),
                      child: const Text(
                        'May 2024 >',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
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
                        // Container dengan ukuran tetap agar teks tetap di posisi yang sama
                        Container(
                          width: 120, // Ukuran tetap agar teks tidak bergeser
                          alignment: Alignment.center,
                          child: Text(
                            'Pemasukan',
                            style: TypographyStyle.h5,
                          ),
                        ),
                        const SizedBox(
                            height: 8), // Jarak antara teks dan garis
                        // Menampilkan garis jika Pemasukan dipilih
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
                        // Container dengan ukuran tetap agar teks tidak bergeser
                        Container(
                          width: 120, // Ukuran tetap agar teks tidak bergeser
                          alignment: Alignment.center,
                          child: Text(
                            'Pengeluaran',
                            style: TypographyStyle.h5,
                          ),
                        ),
                        const SizedBox(
                            height: 8), // Jarak antara teks dan garis
                        // Menampilkan garis jika Pengeluaran dipilih
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
              const SizedBox(height: 30),
              DoughnutChart(),
              const SizedBox(height: 30),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: isIncomeSelected
                    ? _buildIncomeCategoryList()
                    : _buildExpenseCategoryList(),
              ),
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
