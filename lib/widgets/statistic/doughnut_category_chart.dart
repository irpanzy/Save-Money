import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/chart_data_model.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key, required this.isIncomeSelected});
  final bool isIncomeSelected;

  Color generateDynamicColor(int index, bool isIncome) {
    final baseHue = isIncome ? 120 : 0; 
    final hueShift =
        (baseHue + (index * 30)) % 360;
    return HSVColor.fromAHSV(1.0, hueShift.toDouble(), 0.8, 0.9).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());

    return Obx(() {
      final categoryType = isIncomeSelected ? "Income" : "Expense";
      final categoryStats = controller.calculateCategoryStats(categoryType);

      final allZero =
          categoryStats.values.every((entry) => entry['percentage'] == 0);

      if (categoryStats.isEmpty || allZero) {
        return const Center(child: Text("Tidak ada data transaksi."));
      }

      int index = 0;
      final chartData = categoryStats.entries.map((entry) {
        final chartEntry = ChartDataHome(
          entry.key,
          entry.value['totalAmount'],
          '${entry.key} (${entry.value['percentage']}%)',
          generateDynamicColor(index, isIncomeSelected),
        );
        index++;
        return chartEntry;
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }
}
