import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';

class ToggleIncomeExpenseWidget extends StatelessWidget {
  const ToggleIncomeExpenseWidget({super.key, required this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ColorStyle.primaryTextWhite,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorStyle.borderBlackLow),
                boxShadow: const [
                  BoxShadow(
                    color: ColorStyle.Shadow,
                    blurRadius: 6,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.setIsIncome(true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.isIncome.value
                              ? ColorStyle.primaryColor60
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        alignment: Alignment.center,
                        child: Text('Pemasukan',
                            style: TypographyStyle.p1Bold.copyWith(
                                color: controller.isIncome.value
                                    ? ColorStyle.primaryTextWhite
                                    : ColorStyle.primaryTextBlack)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.setIsIncome(false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !controller.isIncome.value
                              ? ColorStyle.secondaryColor50
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        alignment: Alignment.center,
                        child: Text('Pengeluaran',
                            style: TypographyStyle.p1Bold.copyWith(
                              color: !controller.isIncome.value
                                  ? ColorStyle.primaryTextWhite
                                  : ColorStyle.primaryTextBlack,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
