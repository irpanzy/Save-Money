import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TabButton extends StatefulWidget {
  final bool isIncomeSelected;
  final ValueChanged<bool> onTabChanged;

  const TabButton({
    super.key,
    required this.isIncomeSelected,
    required this.onTabChanged,
  });

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            widget.onTabChanged(true);
          },
          child: Column(
            children: [
              Container(
                width: 120,
                alignment: Alignment.center,
                child: Text(
                  'Pemasukan',
                  style: TypographyStyle.h5,
                ),
              ),
              const SizedBox(height: 8),
              if (widget.isIncomeSelected)
                Container(
                  height: 2,
                  width: 120,
                  color: Colors.black,
                ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onTabChanged(false);
          },
          child: Column(
            children: [
              Container(
                width: 120,
                alignment: Alignment.center,
                child: Text(
                  'Pengeluaran',
                  style: TypographyStyle.h5,
                ),
              ),
              const SizedBox(height: 8),
              if (!widget.isIncomeSelected)
                Container(
                  height: 2,
                  width: 120,
                  color: Colors.black,
                ),
            ],
          ),
        ),
      ],
    );
  }

  
}
