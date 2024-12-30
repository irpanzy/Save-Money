import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import '../../models/chart_data_model.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key, required this.isIncomeSelected});
  final bool isIncomeSelected;

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());

    final Map<String, Color> categoryColors = {};

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final categoryType = isIncomeSelected ? "Income" : "Expense";

          final categoryStats = controller.calculateCategoryStats(categoryType);

          final chartData = categoryStats.entries.map((entry) {
            if (!categoryColors.containsKey(entry.key)) {
              categoryColors[entry.key] = getRandomColor();
            }

            return ChartDataHome(
              entry.key,
              entry.value['totalAmount'],
              '${entry.key} (${entry.value['percentage']}%)',
              categoryColors[entry.key]!,
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
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
