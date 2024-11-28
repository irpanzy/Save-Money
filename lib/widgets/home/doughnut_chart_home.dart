import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/home/chart_data_home.dart';

class DoughnutChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, 
      child: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: SfCircularChart(
          series: <CircularSeries>[
            DoughnutSeries<ChartDataHome, String>(
              dataSource: _getChartDataHome(),
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
        ),
      ),
    );
  }

  List<ChartDataHome> _getChartDataHome() {
    return [
      ChartDataHome('Pemasukan', 20, '20%', Color(0xFFB2E600)),
      ChartDataHome('Pengeluaran', 80, '80%', Color(0xFFE60000)),
    ];
  }
}
