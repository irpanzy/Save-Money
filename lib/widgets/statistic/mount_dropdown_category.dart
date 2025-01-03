import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class MonthSelectorCategory extends StatefulWidget {
  const MonthSelectorCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MonthSelectorCategoryState createState() => _MonthSelectorCategoryState();
}

class _MonthSelectorCategoryState extends State<MonthSelectorCategory> {
  final StatistikController controller = Get.put(StatistikController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.fetchAvailableMonths();
      if (controller.availableMonths.isNotEmpty &&
          controller.selectedMonth.value.isEmpty) {
        controller.setSelectedMonth(controller.availableMonths.first);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.availableMonths.isEmpty) {
        return Center(
          child: Text(
            "No months available",
            style: TypographyStyle.l2Regular,
          ),
        );
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
          const SizedBox(
            width: 10.0,
          ),
        ],
      );
    });
  }
}
