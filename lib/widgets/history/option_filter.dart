import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/category_filter_dialog.dart';
import 'package:project_apk_catatan_keuangan/widgets/history/mount_dropdown.dart';

class OptionFilter extends StatelessWidget {
  const OptionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MonthSelector(),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Symbols.filter_alt,
                  color: Colors.black,
                  size: 24,
                  weight: 600,
                ),
                onPressed: () {
                  Get.dialog(
                    Dialog(
                    
                      
                      child: CategoryFilterDialog(),
                    ),
                  );
                },
                tooltip: 'Filter'),
            SizedBox(width: 4),
            IconButton(
              icon: Icon(
                Symbols.swap_vert_rounded,
                color: Colors.black,
                size: 24,
                weight: 600,
              ),
              onPressed: () {
                controller.toggleSortOrder();
              },
              tooltip: 'Sort',
            )
          ],
        )
      ],
    );
  }
}
