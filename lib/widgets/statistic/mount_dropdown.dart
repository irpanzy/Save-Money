import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  final StatistikController controller = Get.put(StatistikController());
  String selectedMonth = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.availableMonths.isNotEmpty) {
        final defaultMonth = controller.selectedMonth.value.isNotEmpty
            ? controller.selectedMonth.value
            : controller.availableMonths.first;

        controller.setSelectedMonth(defaultMonth);

        final historyController = Get.find<HistoryController>();
        historyController.setSelectedMonth(defaultMonth);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (selectedMonth.isEmpty && controller.availableMonths.isNotEmpty) {
        selectedMonth = controller.availableMonths.first;
      }

      return Row(
        children: [
          DropdownButton<String>(
            value: controller.availableMonths
                    .contains(controller.selectedMonth.value)
                ? controller.selectedMonth.value
                : null,
            onChanged: (String? newMonth) {
              if (newMonth != null) {
                controller.setSelectedMonth(newMonth);
                final HistoryController historyController =
                    Get.find<HistoryController>();
                historyController.setSelectedMonth(newMonth);
                print('Selected Month Changed to: $newMonth');
              }
            },
            items: controller.availableMonths
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TypographyStyle.l1Regular,
                ),
              );
            }).toList(),
            underline: Container(),
            dropdownColor: Colors.white,
            icon: const Icon(
              Symbols.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 16,
              weight: 600,
            ),
            alignment: Alignment.center,
            isDense: true,
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      );
    });
  }
}
