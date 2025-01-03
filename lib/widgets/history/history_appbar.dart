import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/history_constroller.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';
import 'navigation.dart';
import 'package:material_symbols_icons/symbols.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.find<HistoryController>();
    return Container(
      decoration: BoxDecoration(color: ColorStyle.primaryColor50, boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.06),
          blurRadius: 8,
        ),
      ]),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
      child: Column(
        children: [
          buildSearchBar(controller),
          const SizedBox(
            height: 16,
          ),
          Navigation(),
        ],
      ),
    );
  }

  Widget buildSearchBar(HistoryController controller) {
    return TextField(
      onChanged: (value) {
        controller.setSearchQuery(value);
      },
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
