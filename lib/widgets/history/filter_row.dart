import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/option_filter.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/time_filter.dart';

class Navigation extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  const Navigation({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          const OptionFilter(),
          const SizedBox( 
            height: 8,
          ),
          TimeFilter(
            selectedFilter: selectedFilter,
            onFilterSelected: onFilterSelected,
          ),
        ],
      ),
    );
  }
}
