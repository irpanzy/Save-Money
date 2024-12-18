import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';

class InputFormWidget extends StatefulWidget {
  final bool isIncome;

  const InputFormWidget({super.key, required this.isIncome});

  @override
  // ignore: library_private_types_in_public_api
  _InputFormWidgetState createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final List<String> _categories = [
    'Gaji',
    'Makanan',
    'Transportasi',
    'Belanja',
    'Pendidikan',
    'Lainnya'
  ];
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Tanggal',
            labelStyle: TypographyStyle.l2Regular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: ColorStyle.grey),
            ),
          ),
        ),
        const SizedBox(height: 24),
        DropdownButtonFormField2<String>(
          value: _selectedCategory,
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  category,
                  style: TypographyStyle.l2Regular,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategory = value;
            });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Symbols.arrow_drop_down,
              weight: 600,
              color: ColorStyle.primaryTextBlack,
            ),
            iconSize: 25,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: ColorStyle.primaryTextBlack),
            ),
            maxHeight: 200,
          ),
          decoration: InputDecoration(
            labelText: 'Kategori',
            labelStyle: TypographyStyle.l2Regular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorStyle.grey),
            ),
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Jumlah',
            prefixText: 'Rp. ',
            labelStyle: TypographyStyle.l2Regular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _noteController,
          style: TypographyStyle.l2Regular,
          decoration: InputDecoration(
            labelText: 'Keterangan',
            labelStyle: TypographyStyle.l2Regular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dateController.text = DateFormat('dd MMM yyyy').format(picked);
    }
  }
}
