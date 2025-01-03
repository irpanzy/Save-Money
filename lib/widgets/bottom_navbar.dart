import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorStyle.borderBlackLow,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Ikon Home
            IconButton(
              icon: Icon(
                Symbols.home_rounded,
                weight: 600,
                color: currentIndex == 0
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () {
                if (currentIndex != 0) {
                  Get.offNamed('/home');
                }
              },
            ),
            // Ikon History
            IconButton(
              icon: Icon(
                Symbols.history_rounded,
                weight: 600,
                color: currentIndex == 1
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () {
                if (currentIndex != 1) {
                  Get.offNamed('/history');
                }
              },
            ),
            // Tombol Input
            Container(
              width: 50,
              height: 55,
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor50,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Symbols.add_rounded,
                    color: Colors.white,
                    size: 20,
                    weight: 600,
                  ),
                  onPressed: () {
                    if (currentIndex != 2) {
                      Get.toNamed('/input');
                    }
                  },
                ),
              ),
            ),
            // Ikon Statistik
            IconButton(
              icon: Icon(
                Symbols.category_rounded,
                weight: 600,
                color: currentIndex == 3
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () {
                if (currentIndex != 3) {
                  Get.offNamed('/statistik');
                }
              },
            ),
            // Ikon Settings
            IconButton(
              icon: Icon(
                Symbols.settings,
                weight: 600,
                color: currentIndex == 4
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () {
                if (currentIndex != 4) {
                  Get.offNamed('/settings');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
