import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/history_appbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/day_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/mounth_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/summary.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/week_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/year_column.dart';
import '../widgets/bottom_navbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            Column(
              children: [
                HistoryAppBar(),
                const SizedBox(height: 24),
                const SummaryCashflow(),
                const SizedBox(height: 32),
                Obx(() {
                  switch (controller.selectedFilter.value) {
                    case "Hari":
                      final groupedTransactions =
                          controller.groupTransactionsByDay(
                        isAscending: controller.isAscending.value,
                      );

                      if (groupedTransactions.isEmpty) {
                        return const Center(
                            child: Text("Tidak ada transaksi."));
                      }

                      return Column(
                        children: groupedTransactions.entries.map((entry) {
                          return DayColumn(
                            date: entry.key,
                            transactions: entry.value,
                          );
                        }).toList(),
                      );
                    case "Minggu":
                      final weeklyTransactions =
                          controller.groupTransactionsByWeek(
                        isAscending: controller.isAscending.value,
                      );

                      if (weeklyTransactions.isEmpty) {
                        return const Center(
                          child: Text("Tidak ada transaksi."),
                        );
                      }

                      return Column(
                        children: weeklyTransactions.entries.map((entry) {
                          final weekNumber = entry.key;
                          final summary = entry.value;

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: WeekColumn(
                              weekNumber: weekNumber,
                              dateRange: summary['dateRange'] ?? '',
                              income: summary['income'] ?? 0.0,
                              expense: summary['expense'] ?? 0.0,
                            ),
                          );
                        }).toList(),
                      );

                    case "Bulan":
                      if (controller.transactions.isEmpty) {
                        controller.showAllTransactions();
                      }

                      final monthlyTransactions =
                          controller.groupTransactionsByMonth(
                        isAscending: controller.isAscending.value,
                      );

                      if (monthlyTransactions.isEmpty) {
                        return const Center(
                          child: Text("Tidak ada transaksi."),
                        );
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: monthlyTransactions.entries.map((entry) {
                            final monthName = entry.key;
                            final summary = entry.value;

                            return MounthColumn(
                              monthName: monthName,
                              income: summary['income'] ?? 0.0,
                              expense: summary['expense'] ?? 0.0,
                            );
                          }).toList(),
                        ),
                      );
                    case "Tahun":
                      if (controller.transactions.isEmpty) {
                        controller.showAllTransactions();
                      }

                      final yearlyTransactions =
                          controller.groupTransactionsByYear(
                        isAscending: controller.isAscending.value,
                      );

                      if (yearlyTransactions.isEmpty) {
                        return const Center(
                          child: Text("Tidak ada transaksi."),
                        );
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: yearlyTransactions.entries.map((entry) {
                            final year = entry.key; // Tahun
                            final summary = entry.value;

                            return YearColumn(
                              year: year,
                              income: summary['income'] ?? 0.0,
                              expense: summary['expense'] ?? 0.0,
                            );
                          }).toList(),
                        ),
                      );
                    default:
                      return const SizedBox();
                  }
                }),
                const SizedBox(height: 64)
              ],
            ),
          ]),
          BottomNavbar(
            currentIndex: 1,
          ),
        ],
      ),
    );
  }
}
