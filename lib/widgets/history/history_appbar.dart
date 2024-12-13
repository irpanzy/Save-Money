import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';
import 'filter_row.dart';
import 'package:material_symbols_icons/symbols.dart';

class HistoryAppBar extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;
  final ValueChanged<String> onSearchChanged;

  const HistoryAppBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorStyle.primaryColor50, boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          color: Colors.black.withOpacity(0.06),
          blurRadius: 8,
        ),
      ]),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
      child: Column(
        children: [
          buildSearchBar(),
          const SizedBox(
            height: 16,
          ),
          Navigation(
            selectedFilter: selectedFilter,
            onFilterSelected: onFilterSelected,
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: "Cari...",
        hintStyle: TypographyStyle.l1Regular,
        suffixIcon: const Icon(
          Symbols.search_rounded,
          color: Colors.black,
          size: 28,
          weight: 600,
        ),
        filled: true,
        fillColor: ColorStyle.primaryColor50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 3),
        ),
      ),
    );
  }
}
