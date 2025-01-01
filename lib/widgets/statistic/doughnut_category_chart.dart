import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import '../../models/chart_data_model.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key, required this.isIncomeSelected});
  final bool isIncomeSelected;

  Color getRandomColor(Color baseColor) {
    final random = Random();

    int red = baseColor.red + random.nextInt(30) - 15; // Variasi ±15
    int green = baseColor.green + random.nextInt(30) - 15;
    int blue = baseColor.blue + random.nextInt(30) - 15;

    red = red.clamp(0, 255);
    green = green.clamp(0, 255);
    blue = blue.clamp(0, 255);

    return Color.fromARGB(255, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());

    return Obx(() {
      final categoryType = isIncomeSelected ? "Income" : "Expense";
      final categoryStats = controller.calculateCategoryStats(categoryType);

      if (categoryStats.isEmpty) {
        return const Center(child: Text("Tidak ada data untuk chart."));
      }

      final baseColor = isIncomeSelected
          ? const Color(0xFFCCFF00)
          : const Color(0xFFE60000); 

      final chartData = categoryStats.entries.map((entry) {
        return ChartDataHome(
          entry.key,
          entry.value['totalAmount'],
          '${entry.key} (${entry.value['percentage']}%)',
          getRandomColor(baseColor),
        );
      }).toList();

      return SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<ChartDataHome, String>(
            dataSource: chartData,
            xValueMapper: (ChartDataHome data, _) => data.category,
            yValueMapper: (ChartDataHome data, _) => data.value,
            dataLabelMapper: (ChartDataHome data, _) => data.percentage,
            pointColorMapper: (ChartDataHome data, _) => data.color,
            radius: '90%',
            innerRadius: '70%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
            ),
          ),
        ],
      );
    });
  }
}
