import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  String selectedMonth = 'May 2024';

  List<String> months = [
    'May 2024',
    'June 2024',
    'July 2024',
    'August 2024',
    'September 2024',
    'October 2024',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DropdownButton<String>(
      value: selectedMonth,
      onChanged: (String? newMonth) {
        setState(() {
          selectedMonth = newMonth ?? selectedMonth;
        });
      },
      items: months.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TypographyStyle.l1Regular,
          ),
        );
      }).toList(),
      underline: Container(),
      dropdownColor: Colors.white,
      icon: const Icon(
        Symbols.arrow_forward_ios_rounded,
        color: Colors.black,
        size: 16,
        weight: 600,
      ),
      alignment: Alignment.center,
      isDense: true,
    ));
  }
}
