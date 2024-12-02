import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../helpers/filter_helper.dart';
import '../widgets/history/filter_widget.dart';
import '../widgets/history/list_input_widget.dart';
import '../widgets/bottom_navbar.dart';
import '../main.dart';

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
    // Filtered pencarian
    final filteredTransactions = FilterHelper.filterTransactions(
      globalTransactions,
      _selectedFilter,
      _searchQuery,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: HistoryAppBar(
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
      ),
      body: Stack(children: [
        ListView(children: [
          HistoryTransactionList(transactions: filteredTransactions)
        ]),
        BottomNavbar(
          currentIndex: _currentIndex,
          onTap: _onTap,
        )
      ]),
    );
  }
}
