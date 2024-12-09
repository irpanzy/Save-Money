import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class InputFormWidget extends StatefulWidget {
  final bool isIncome;

  InputFormWidget({Key? key, required this.isIncome}) : super(key: key);

  @override
  _InputFormWidgetState createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final List<String> _categories = ['Gaji', 'Makanan', 'Transportasi', 'Belanja', 'Pendidikan', 'Lainnya'];
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          style: const TextStyle(
            fontFamily: "Poppins_Regular",
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Tanggal',
            labelStyle: const TextStyle(
              fontFamily: "Poppins_Regular",
              fontSize: 14,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 35),
        DropdownButtonFormField2<String>(
          value: _selectedCategory,
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  category,
                  style: const TextStyle(
                    fontFamily: "Poppins_Regular",
                    fontSize: 14,
                    color: Colors.black,
                  ),
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
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
            iconSize: 25,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color.fromARGB(255, 30, 5, 5)),
            ),
            maxHeight: 200,
          ),
          decoration: InputDecoration(
            labelText: 'Kategori',
            labelStyle: const TextStyle(
              fontFamily: "Poppins_Regular",
              fontSize: 14,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 35),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: "Poppins_Regular",
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Jumlah',
            prefixText: 'Rp. ',
            labelStyle: const TextStyle(
              fontFamily: "Poppins_Regular",
              fontSize: 14,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 35),
        TextField(
          controller: _noteController,
          style: const TextStyle(
            fontFamily: "Poppins_Regular",
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Keterangan',
            labelStyle: const TextStyle(
              fontFamily: "Poppins_Regular",
              fontSize: 14,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
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
