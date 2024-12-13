import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/main.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/history_appbar.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/day_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/mounth_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/summary.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/week_column.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/year_column.dart';
import '../helpers/navigation_helper.dart';
import '../helpers/filter_helper.dart';
import '../widgets/bottom_navbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 1;
  String _selectedFilter = "Hari";
  String _searchQuery = "";

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    FilterHelper.filterTransactions(
      globalTransactions,
      _selectedFilter,
      _searchQuery,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            Column(
              children: [
                HistoryAppBar(
                  selectedFilter: _selectedFilter,
                  onFilterSelected: (filter) {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  onSearchChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                const SummaryCashflow(),
                const SizedBox(height: 32),
                if (_selectedFilter == "Hari")
                  Column(
                    children: const [
                      DayColumn(),
                      DayColumn(),
                      DayColumn(),
                      DayColumn(),
                    ],
                  )
                else if (_selectedFilter == "Minggu")
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: const [
                        WeekColumn(),
                        WeekColumn(),
                        WeekColumn()
                      ],
                    ),
                  )
                else if (_selectedFilter == "Bulan")
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: const [
                        MounthColumn(),
                        MounthColumn(),
                        MounthColumn()
                      ],
                    ),
                  )
                else if (_selectedFilter == "Tahun")
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: const [
                        YearColumn(),
                        YearColumn(),
                        YearColumn(),
                      ],
                    ),
                  ),
                const SizedBox(height: 64)
              ],
            ),
          ]),
          BottomNavbar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}
