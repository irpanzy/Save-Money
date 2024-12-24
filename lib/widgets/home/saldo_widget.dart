import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/homescreen_controller.dart';
import 'package:project_apk_catatan_keuangan/controller/setting_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';

class SaldoWidget extends StatelessWidget {
  const SaldoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());
    settingsController.fetchUserName();
    final HomescreenController homescreenController =
        Get.put(HomescreenController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorStyle.primaryColor50, ColorStyle.primaryColor50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hallo!', style: TypographyStyle.l3Regular),
                    Obx(() => Text(
                          settingsController.userName.value,
                          style: TypographyStyle.h4,
                        )),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    settingsController.fetchUserName();
                  },
                  child: Icon(
                    Symbols.notifications,
                    weight: 600,
                    color: ColorStyle.iconActive,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Saldo anda', style: TypographyStyle.l2Regular),
                  Obx(() => Text(
                      "${CurrencySaldoHelper.formatRupiah(homescreenController.saldo.value)} IDR",
                      style: TypographyStyle.h1
                          .copyWith(fontSize: 40, fontFamily: "Poppins_bold"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
