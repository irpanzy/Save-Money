import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/mount_dropdown.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Symbols.arrow_back_rounded,
                        color: Colors.black,
                        size: 24,
                        weight: 600,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Statistik',
                      style: TypographyStyle.h4,
                    ),
                    const Spacer(),
                    const MonthSelector(),
                  ],
                ),
              );
  }
}