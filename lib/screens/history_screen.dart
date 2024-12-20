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
                      return Column(
                        children: const [
                          DayColumn(),
                          DayColumn(),
                          DayColumn(),
                          DayColumn(),
                        ],
                      );
                    case "Minggu":
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: const [
                            WeekColumn(),
                            WeekColumn(),
                            WeekColumn(),
                          ],
                        ),
                      );
                    case "Bulan":
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: const [
                            MounthColumn(),
                            MounthColumn(),
                            MounthColumn(),
                          ],
                        ),
                      );
                    case "Tahun":
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: const [
                            YearColumn(),
                            YearColumn(),
                            YearColumn(),
                          ],
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
