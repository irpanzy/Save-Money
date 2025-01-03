import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/sub_category_controller.dart';
import 'package:project_apk_catatan_keuangan/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SubCategoryChart extends StatelessWidget {
  const SubCategoryChart({
    required this.categoryId,
    required this.categoryType,
    super.key,
  });

  final int categoryId;
  final String categoryType;

  double formatValueForChart(double value) {
    if (value >= 1000000) {
      return double.parse((value / 1000000).toStringAsFixed(1));
    } else if (value >= 1000) {
      return double.parse((value / 1000).toStringAsFixed(1));
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SubCategoryController controller = Get.find<SubCategoryController>();

    return Obx(() {
      if (controller.filteredChartData.isEmpty) {
        return const Center(
          child: Text(
            'No data available',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      final sortedData = controller.filteredChartData.toList()
        ..sort((a, b) {
          if (controller.isFilteredByMonth.value) {
            return int.parse(a['monthOrDay']!)
                .compareTo(int.parse(b['monthOrDay']!));
          } else {
            final DateTime dateA = DateFormat('MMM').parse(a['monthOrDay']!);
            final DateTime dateB = DateFormat('MMM').parse(b['monthOrDay']!);
            return dateA.compareTo(dateB);
          }
        });

      final lineColor = categoryType == 'Income'
          ? ColorStyle.primaryColor60
          : ColorStyle.secondaryColor50;

      return SizedBox(
        height: 200,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
              text: controller.isFilteredByMonth.value ? 'Tanggal' : 'Bulan',
            ),
            labelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          primaryYAxis: NumericAxis(
            labelFormat: '{value}k', // Format label Y
            majorGridLines: const MajorGridLines(width: 0.5),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
          ),
          series: <SplineSeries<Map<String, dynamic>, String>>[
            SplineSeries<Map<String, dynamic>, String>(
              dataSource: sortedData,
              xValueMapper: (data, _) =>
                  data['monthOrDay']!,
              yValueMapper: (data, _) => formatValueForChart(data['value']),
              color: lineColor,
              markerSettings: MarkerSettings(
                isVisible: true,
                shape: DataMarkerType.circle,
                width: 6,
                height: 6,
                color: lineColor,
                borderWidth: 0,
              ),
            ),
          ],
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      );
    });
  }
}
