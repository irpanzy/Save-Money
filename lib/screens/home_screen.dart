import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/home/expense_item_home.dart';
import '../widgets/home/income_expense_row_home.dart';
import '../widgets/home/doughnut_chart_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Saldo
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFCCFF00), Color(0xFFB2E600)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/ganesha.png'),
                          radius: 24,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hallo!',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins_Regular",
                              ),
                            ),
                            Text(
                              'Ganesha Rahman',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: "Poppins_SemiBold"),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.notifications_none, color: Colors.black54),
                      ],
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Saldo anda',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins_Regular",
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '150.000 IDR',
                            style: TextStyle(
                                fontSize: 40, fontFamily: "Poppins_Bold"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Section Pengeluaran Terbesar Bulan ini
              SizedBox(height: 75),
              Text(
                'Pengeluaran Terbesar Bulan ini',
                style: TextStyle(fontSize: 18, fontFamily: "Poppins_Bold"),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  ExpenseItemHome('Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
                  ExpenseItemHome('Sedekah', 'Traktir teman', 'Rp50,000.00'),
                  ExpenseItemHome('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
                ],
              ),
              // Section Recap Bulan Ini
              SizedBox(height: 75),
              IncomeExpenseRowHome(title: 'Recap bulan ini'),
              // Doughnut Chart
              SizedBox(height: 40),
              DoughnutChart(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(context),
    );
  }
}
