import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/widgets/statistic/mount_dropdown.dart';

class OptionFilter extends StatelessWidget {
  const OptionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MonthSelector(),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Symbols.filter_alt,
                  color: Colors.black,
                  size: 24,
                  weight: 600,
                ),
                onPressed: () {},
                tooltip: 'Filter'),
            SizedBox(width: 4),
            IconButton(
                icon: const Icon(
                  Symbols.swap_vert,
                  color: Colors.black,
                  size: 24,
                  weight: 600,
                ),
                onPressed: () {},
                tooltip: 'Filter'),
          ],
        )
      ],
    );
  }
}
