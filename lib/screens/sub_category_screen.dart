import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SubCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primaryTextWhite,
      appBar: AppBar(
        backgroundColor: ColorStyle.primaryTextWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorStyle.iconActive),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // Mengurangi jarak antara leading dan title
        title: Row(
          children: [
            Text(
              'Freelance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorStyle.primaryTextBlack,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_back_ios, size: 14, color: ColorStyle.iconActive),
            Text(
              'Oktober',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorStyle.primaryTextBlack,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 14, color: ColorStyle.iconActive),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chart
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <SplineSeries<Map<String, dynamic>, String>>[
                  SplineSeries<Map<String, dynamic>, String>(
                    dataSource: [
                      {'month': 'Jan', 'value': 40},
                      {'month': 'Feb', 'value': 50},
                      {'month': 'Mar', 'value': 30},
                      {'month': 'Apr', 'value': 60},
                      {'month': 'May', 'value': 45},
                    ],
                    xValueMapper: (data, _) => data['month']!,
                    yValueMapper: (data, _) => data['value']!,
                    color: ColorStyle.primaryColor50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Row for Transaksi Info and Dropdown
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorStyle.primaryColor50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '2 Transaksi',
                    style: TextStyle(
                      color: ColorStyle.primaryTextBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Terbaru',
                    items: [
                      DropdownMenuItem(
                        value: 'Terbaru',
                        child: Text(
                          'Terbaru',
                          style: TextStyle(
                            color: ColorStyle.primaryTextBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                    icon: Icon(Icons.arrow_drop_down, color: ColorStyle.iconActive),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Daftar Transaksi
            Expanded(
              child: ListView(
                children: [
                  TransactionItem(
                    date: '10',
                    monthYear: '09 2024',
                    day: 'Senin',
                    income: 'Rp1.000.000',
                    expense: 'Rp0',
                    title: 'Freelance',
                    description: 'Project Web Laundry',
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  TransactionItem(
                    date: '17',
                    monthYear: '09 2024',
                    day: 'Selasa',
                    income: 'Rp300.000',
                    expense: 'Rp0',
                    title: 'Freelance',
                    description: 'Project koperasi psikopabri',
                  ),
                ],
              ),
            ),

            // Total
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Rp1.300.000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.primaryTextBlack,
                    ),
                    textAlign: TextAlign.left, // Memastikan teks rata tengah
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Total Pemasukan Freelance Bulan Ini',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorStyle.primaryTextBlack,
                    ),
                    textAlign: TextAlign.left, // Memastikan teks rata tengah
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String date;
  final String monthYear;
  final String day;
  final String income;
  final String expense;
  final String title;
  final String description;

  const TransactionItem({
    required this.date,
    required this.monthYear,
    required this.day,
    required this.income,
    required this.expense,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tanggal
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.primaryTextBlack,
                ),
              ),
              Row(
                children: [
                  Text(
                    monthYear,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorStyle.primaryColor50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorStyle.primaryTextBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),

          // Detail Transaksi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      income,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorStyle.primaryColor50,
                      ),
                    ),
                    Text(
                      expense,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorStyle.primaryTextBlack,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
