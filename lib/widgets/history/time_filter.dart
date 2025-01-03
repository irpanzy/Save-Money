import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ["Hari", "Minggu", "Bulan", "Tahun"];
    final HistoryController controller = Get.find<HistoryController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters.map((filter) {
        return GestureDetector(
            onTap: () => controller.setFilter(filter),
            child: Obx(() => Column(
                  children: [
                    Text(filter, style: TypographyStyle.p2Regular),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      height: 3,
                      width: 60,
                      color: controller.selectedFilter.value == filter
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                )));
      }).toList(),
    );
  }
}
