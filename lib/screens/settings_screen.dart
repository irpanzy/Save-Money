import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/controller/setting_controller.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/settings/custom_switch.dart';
import '../widgets/bottom_navbar.dart';

class SettingsScreen extends StatelessWidget {
  final int currentIndex;

  const SettingsScreen({
    super.key,
    this.currentIndex = 4,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());
    settingsController.fetchUserName();

    return Obx(() => Scaffold(
          backgroundColor:
              settingsController.isDarkMode.value ? Colors.black : Colors.white,
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 40),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: settingsController.isDarkMode.value
                          ? Colors.grey[900]
                          : ColorStyle.primaryColor50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg'),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          settingsController.userName.value,
                          style: settingsController.isDarkMode.value
                              ? TypographyStyle.l1Bold
                                  .copyWith(color: Colors.white)
                              : TypographyStyle.l1Bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(
                      "Settings",
                      style: settingsController.isDarkMode.value
                          ? TypographyStyle.h4.copyWith(color: Colors.white)
                          : TypographyStyle.h4,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Symbols.brightness_low,
                      weight: 600,
                      color: ColorStyle.iconActive,
                    ),
                    title: Text(
                      'Tema Gelap',
                      style: settingsController.isDarkMode.value
                          ? TypographyStyle.l2Regular
                              .copyWith(color: Colors.white)
                          : TypographyStyle.l2Regular,
                    ),
                    trailing: CustomSwitch(),
                  ),
                  ListTile(
                    leading: Icon(
                      Symbols.language,
                      weight: 600,
                      color: ColorStyle.iconActive,
                    ),
                    title: Text(
                      'Bahasa',
                      style: settingsController.isDarkMode.value
                          ? TypographyStyle.l2Regular
                              .copyWith(color: Colors.white)
                          : TypographyStyle.l2Regular,
                    ),
                    trailing: Text(""),
                    onTap: () async {},
                  ),
                  ListTile(
                    leading: Icon(
                      Symbols.paid,
                      weight: 600,
                      color: ColorStyle.iconActive,
                    ),
                    title: Text(
                      'Mata Uang',
                      style: settingsController.isDarkMode.value
                          ? TypographyStyle.l2Regular
                              .copyWith(color: Colors.white)
                          : TypographyStyle.l2Regular,
                    ),
                    trailing: Text(""),
                    onTap: () {},
                  ),
                  // Tambahkan pengaturan lainnya...
                ],
              ),
              BottomNavbar(
                currentIndex: 4,
              ),
            ],
          ),
        ));
  }
}
