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
                fillColor: Color(0xFFCCFF00),
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
        preferredSize: const Size.fromHeight(140.0),
        child: Column(
          children: [
            Container(
              color: const Color(0xFFCCFF00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {},
                  ),
                  Text(
                    "Oktober",
                    style: const TextStyle(
                      fontFamily: "Poppins_Regular",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.filter_list, color: Colors.black),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.swap_vert, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Pemasukan",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rp450.000",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Pengeluaran",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rp550.000",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Saldo",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rp150.000",
                        style: TextStyle(
                          fontFamily: "Poppins_Regular",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
