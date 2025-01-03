import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_apk_catatan_keuangan/helpers/db_helper.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      final isNameAvailable = await dbHelper.isNameAvailable();

      if (isNameAvailable) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/input_name');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primaryColor50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SaveMoney',
              style: TypographyStyle.h1,
            ),
            Text(
              'Kelola keuangan anda',
              style: TypographyStyle.l2Regular,
            ),
          ],
        ),
      ),
    );
  }
}
