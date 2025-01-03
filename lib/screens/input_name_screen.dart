import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/controller/setting_controller.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class InputNameScreen extends StatelessWidget {
  InputNameScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primaryColor50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Siapa Nama Anda',
              style: TypographyStyle.h3,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Masukkan nama anda',
                  hintStyle: TypographyStyle.l2Regular,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) => _settingsController.saveName(value),
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
