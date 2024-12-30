import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget({required this.controller, super.key});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input Tanggal
        TextField(
          controller: controller.dateController,
          readOnly: true,
          onTap: () => controller.selectDate(context),
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Tanggal',
            labelStyle: TypographyStyle.l2Regular,
            floatingLabelStyle: TypographyStyle.l2Regular.copyWith(
              color: ColorStyle.primaryTextBlack,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: ColorStyle.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorStyle.borderBlackActive, width: 3),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Obx(() => controller.dateError.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  controller.dateError.value,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            : const SizedBox.shrink()),
        const SizedBox(height: 24),

        // Dropdown Kategori
        Obx(() {
          final selectedValue = controller.selectedCategoryId.value;

          if (selectedValue != null &&
              !controller.filteredCategories
                  .any((category) => category.id == selectedValue)) {
            controller.selectedCategoryId.value = null;
          }

          final dropdownItems = controller.filteredCategories
              .map<DropdownMenuItem<int>>((category) {
            return DropdownMenuItem<int>(
              value: category.id,
              child: Text(category.title, style: TypographyStyle.l2Regular),
            );
          }).toList();

          return DropdownButtonFormField2<int>(
            value: selectedValue,
            items: dropdownItems,
            onChanged: (value) {
              controller.selectedCategoryId.value = value;
            },
            iconStyleData: const IconStyleData(
              icon: Icon(
                Symbols.arrow_drop_down,
                weight: 600,
                color: ColorStyle.primaryTextBlack,
              ),
              iconSize: 25,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorStyle.primaryTextBlack),
              ),
              maxHeight: 200,
            ),
            decoration: InputDecoration(
              labelText: 'Kategori',
              labelStyle: TypographyStyle.l2Regular,
              floatingLabelStyle: TypographyStyle.l2Regular.copyWith(
                color: ColorStyle.primaryTextBlack,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorStyle.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorStyle.borderBlackActive, width: 3),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        }),
        Obx(() => controller.categoryError.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  controller.categoryError.value,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            : const SizedBox.shrink()),
        const SizedBox(height: 24),

        // Input Jumlah
        TextField(
          controller: controller.amountController,
          keyboardType: TextInputType.number,
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Jumlah',
            prefixText: 'Rp. ',
            labelStyle: TypographyStyle.l2Regular,
            floatingLabelStyle: TypographyStyle.l2Regular.copyWith(
              color: ColorStyle.primaryTextBlack,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorStyle.borderBlackActive,
                  width: 3), // Border saat fokus
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Obx(() => controller.amountError.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  controller.amountError.value,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            : const SizedBox.shrink()),
        const SizedBox(height: 24),

        // Input Keterangan
        TextField(
          controller: controller.deskripsiController,
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Keterangan',
            labelStyle: TypographyStyle.l2Regular,
            floatingLabelStyle: TypographyStyle.l2Regular.copyWith(
              color: ColorStyle.primaryTextBlack,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorStyle.borderBlackActive, width: 3),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Obx(() => controller.descriptionError.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  controller.descriptionError.value,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            : const SizedBox.shrink()),
        const SizedBox(height: 24),
      ],
    );
  }
}
