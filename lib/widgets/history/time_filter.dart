import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter({super.key,required this.selectedFilter,
    required this.onFilterSelected,});
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  @override
  Widget build(BuildContext context) {
    final filters = ["Hari", "Minggu", "Bulan", "Tahun"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters.map((filter) {
        return GestureDetector(
          onTap: () => onFilterSelected(filter),
          child: Column(
            children: [
              Text(filter, style: TypographyStyle.p2Regular),
              Container(
                margin: const EdgeInsets.only(top: 6),
                height: 3,
                width: 60,
                color: selectedFilter == filter
                    ? Colors.black
                    : Colors.transparent,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
