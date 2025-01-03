import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/setting_controller.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  final SettingsController settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            settingsController.toggleDarkMode();
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 60,
            height: 30,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: settingsController.isDarkMode.value
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: settingsController.isDarkMode.value
                    ? Colors.lime
                    : Colors.grey,
                width: 2,
              ),
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment: settingsController.isDarkMode.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: settingsController.isDarkMode.value
                      ? Colors.lime
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ));
  }
}
