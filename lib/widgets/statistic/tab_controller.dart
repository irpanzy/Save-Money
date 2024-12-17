import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/statistik_controller.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TabButton extends StatelessWidget {
  const TabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.find<StatistikController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            controller.setIsIncomeSelected(true);
          },
          child: Obx(() => Column(
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    child: Text(
                      'Pemasukan',
                      style: TypographyStyle.h5.copyWith(
                        color: controller.isIncomeSelected.value
                            ? Colors.black
                            : const Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (controller.isIncomeSelected.value)
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.black,
                    ),
                ],
              )),
        ),
        GestureDetector(
          onTap: () {
            controller.setIsIncomeSelected(false);
          },
          child: Obx(() => Column(
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    child: Text(
                      'Pengeluaran',
                      style: TypographyStyle.h5.copyWith(
                        color: !controller.isIncomeSelected.value
                            ? Colors.black
                            : const Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (!controller.isIncomeSelected.value)
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.black,
                    ),
                ],
              )),
        ),
      ],
    );
  }
}
