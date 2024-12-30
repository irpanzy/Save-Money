import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/core.dart';

class CategoryFilterDialog extends StatefulWidget {
  const CategoryFilterDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryFilterDialogState createState() => _CategoryFilterDialogState();
}

class _CategoryFilterDialogState extends State<CategoryFilterDialog> {
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorStyle.grey,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Kategori',
            style: TypographyStyle.h4,
          ),
          const SizedBox(height: 16),
          Obx(() {
            return DropdownButtonFormField<int>(
              value: historyController.selectedCategory.value,
              items: historyController.categories
                  .map(
                    (category) => DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.title),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                historyController.selectedCategory.value = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorStyle.borderBlackActive, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: 'Pilih kategori',
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            );
          }),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Batal',
                  style: TextStyle(color: ColorStyle.secondaryColor50),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (historyController.selectedCategory.value != null) {
                    historyController.filterTransactionsByCategory(
                      historyController.selectedCategory.value!,
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: ColorStyle.borderBlackLow,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                ),
                child: Text(
                  'OK',
                  style: TypographyStyle.l1Bold.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
