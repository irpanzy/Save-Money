import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              SizedBox(height: 50),
              Text(
                'Pengeluaran Terbesar Bulan ini',
                style: TextStyle(fontSize: 18, fontFamily: "Poppins_SemiBold"),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  _buildExpenseItem(
                      'Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
                  _buildExpenseItem('Sedekah', 'Traktir teman', 'Rp50,000.00'),
                  _buildExpenseItem('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
                ],
              ),
              SizedBox(height: 75),
              Text(
                'Recap bulan ini',
                style: TextStyle(fontSize: 18, fontFamily: "Poppins_SemiBold"),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIncomeExpenseBox(Icons.arrow_upward, 'Pemasukan',
                      '2.000 IDR', Color(0xFFB2E600)),
                  _buildIncomeExpenseBox(Icons.arrow_downward, 'Pengeluaran',
                      '10.000 IDR', Color(0xFFE60000)),
                ],
              ),
              SizedBox(height: 20),
              _buildDoughnutChart(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFB2E600),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.category, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/statistik');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseItem(String category, String description, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins_Medium",
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontFamily: "Poppins_Regular",
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFE60000),
              fontFamily: "Poppins_Medium",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeExpenseBox(
      IconData icon, String title, String amount, Color color) {
    return Container(
      width: 225,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins_SemiBold",
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Poppins_Bold",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoughnutChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelMapper: (ChartData data, _) => data.percentage,
            pointColorMapper: (ChartData data, _) => data.color,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }

  List<ChartData> _getChartData() {
    return [
      ChartData('Pemasukan', 20, '20%', Color(0xFFB2E600)),
      ChartData('Pengeluaran', 80, '80%', Color(0xFFE60000)),
    ];
  }
}

class ChartData {
  final String category;
  final double value;
  final String percentage;
  final Color color;

  ChartData(this.category, this.value, this.percentage, this.color);
}
