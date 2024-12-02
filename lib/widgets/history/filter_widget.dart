import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';

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
    final filters = ["Hari", "Minggu", "Bulan", "Tahun"];

    return AppBar(
      backgroundColor: ColorStyle.primaryColor50,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: "Cari kategori...",
                hintStyle: const TextStyle(fontFamily: "Poppins_Regular"),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFCCFF00), // Warna background search bar
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Container(
          color: const Color(0xFFCCFF00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: filters.map((filter) {
              return GestureDetector(
                onTap: () => onFilterSelected(filter),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filter,
                      style: TextStyle(
                        color: selectedFilter == filter
                            ? Colors.black
                            : Colors.grey[800],
                        fontFamily: "Poppins_Regular",
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
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
          ),
        ),
      ),
    );
  }
}
