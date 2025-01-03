import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/core.dart';
import 'package:project_apk_catatan_keuangan/screens/category_input_screen.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Kategori",
            style: TypographyStyle.h4,
          ),
          IconButton(
            icon: Icon(
              Symbols.add_2_rounded,
              weight: 600,
            ),
            onPressed: () {
              Get.dialog(
                const InputCategoryModal(),
              );
            },
          ),
        ],
      ),
    );
  }
}
