import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/chart_data_model.dart';
import '../../style/color_style.dart';
import '../../controller/homescreen_controller.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key});

  @override
  Widget build(BuildContext context) {
    final HomescreenController controller = Get.put(HomescreenController());

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final total = controller.income.value + controller.expense.value;

          final incomeValue = total > 0 ? controller.income.value : 50.0;
          final expenseValue = total > 0 ? controller.expense.value : 50.0;
          final incomePercentage = total > 0
              ? (controller.income.value / total * 100).toStringAsFixed(1)
              : '50';
          final expensePercentage = total > 0
              ? (controller.expense.value / total * 100).toStringAsFixed(1)
              : '50';

          final chartData = [
            ChartDataHome(
              'Pemasukan',
              incomeValue,
              '$incomePercentage%',
              ColorStyle.incomeChartHome,
            ),
            ChartDataHome(
              'Pengeluaran',
              expenseValue,
              '$expensePercentage%',
              ColorStyle.secondaryColor50,
            ),
          ];

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
        }),
      ),
    );
  }
}
