import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../widgets/bottom_navbar.dart';
import '../main.dart'; 
import 'package:intl/intl.dart'; 

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int _currentIndex = 2;

  bool isIncome = true;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String? _selectedCategory;
  DateTime? _selectedDate; // Tanggal dipilih user
  final List<String> _categories = [
    'Makanan',
    'Transportasi',
    'Belanja',
    'Hiburan',
    'Kesehatan',
    'Lainnya',
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            DateFormat('dd/MM/yyyy').format(picked); // Format untuk display
      });
    }
  }

  void saveTransaction() {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap pilih tanggal.')),
      );
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap pilih kategori.')),
      );
      return;
    }

    if (_amountController.text.isEmpty ||
        int.tryParse(_amountController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap masukkan jumlah yang valid.')),
      );
      return;
    }

    final transaction = {
      'type': isIncome ? 'Pemasukan' : 'Pengeluaran',
      'date': _selectedDate, // Simpan tanggal sebagai DateTime
      'category': _selectedCategory ?? '',
      'amount': isIncome
          ? int.parse(_amountController.text) // Positif untuk Pemasukan
          : -int.parse(_amountController.text), // Negatif untuk Pengeluaran
      'note': _noteController.text,
    };

    // Tambahkan transaksi ke globalTransactions
    setState(() {
      globalTransactions.add(transaction);
    });

    // Tampilkan notifikasi data berhasil ditambahkan
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil ditambahkan!'),
        duration: Duration(seconds: 2),
      ),
    );

    // Reset input form
    setState(() {
      _dateController.clear();
      _amountController.clear();
      _noteController.clear();
      _selectedCategory = null;
      _selectedDate = null;
      isIncome = true; // Reset tipe transaksi ke "Pemasukan"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Buat Transaksi',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncome = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isIncome ? Color(0xFFB2E600) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Pemasukan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncome = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !isIncome ? Color(0xFFE60000) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Pengeluaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date Picker Input
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: const TextStyle(color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCFF00), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.blue),
                  onPressed: () => _selectDate(context),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown untuk kategori (dibungkus dengan Container untuk borderRadius)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  labelStyle: TextStyle(color: Colors.black54),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  border: InputBorder.none, // Menghilangkan border default
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Input jumlah uang
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Jumlah',
                labelStyle: const TextStyle(color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCFF00), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // TextField(
            //   controller: _noteController,
            //   decoration: InputDecoration(
            //     labelText: 'Keterangan',
            //     labelStyle: const TextStyle(color: Colors.black54),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide:
            //           const BorderSide(color: Color(0xFFCCFF00), width: 2),
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),

            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: saveTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isIncome ? Color(0xFFB2E600) : Color(0xFFE60000),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
