import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:material_symbols_icons/symbols.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavbar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16, // Jarak navbar dari bawah layar
      left: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorStyle.borderBlackLow, // Warna border
            width: 1, // Lebar border
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
            IconButton(
              icon: Icon(
                Symbols.home_rounded,
                weight: 600,
                color: currentIndex == 0
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Icon(
                Symbols.history_rounded,
                weight: 600,
                color: currentIndex == 1
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () => onTap(1),
            ),
            Container(
              width: 50,
              height: 55,
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor60,
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
                  onPressed: () => onTap(2),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Symbols.category_rounded,
                weight: 600,
                color: currentIndex == 3
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () => onTap(3),
            ),
            IconButton(
              icon: Icon(
                Symbols.settings,
                weight: 600,
                color: currentIndex == 4
                    ? ColorStyle.iconActive
                    : ColorStyle.iconNotActive,
              ),
              onPressed: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
