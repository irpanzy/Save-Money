import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/sub_category/mount_dropdown_subcategory.dart';

class HeaderSubCategory extends StatelessWidget {
  const HeaderSubCategory({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Symbols.arrow_back_rounded,
              color: Colors.black,
              size: 24,
              weight: 600,
            ),
            onPressed: () {
              Get.toNamed('/statistik');
            },
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TypographyStyle.h4,
          ),
          const Spacer(),
          const MonthSelectorSubCategory(),
        ],
      ),
    );
  }
}
