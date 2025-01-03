import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final String amount;
  final int percentage;
  final Function()? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    this.amount = "0",
    this.percentage = 0,
    this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());
    return Obx(() => GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: ColorStyle.borderBlack,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: controller.isIncomeSelected.value
                      ? ColorStyle.primaryColor60
                      : ColorStyle.secondaryColor50,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '${widget.percentage}%',
                  style: controller.isIncomeSelected.value
                      ? TypographyStyle.l3Bold.copyWith(color: Colors.black)
                      : TypographyStyle.l3Bold.copyWith(color: Colors.white),
                ),
              ),
              title: Text(
                widget.title,
                style: TypographyStyle.l2Regular,
              ),
              trailing: Text("${widget.amount} IDR",
                  style: TypographyStyle.l2Regular),
            ),
          ),
        ));
  }
}
