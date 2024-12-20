import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MonthSelectorState createState() => _MonthSelectorState();
}

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class _MonthSelectorState extends State<MonthSelector> {
  String selectedMonth = months[DateTime.now().month - 1];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
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
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
