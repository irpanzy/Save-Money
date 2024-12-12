import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/input/input_form_widget.dart';
import '../widgets/input/toggle_income_expense_widget.dart';
import '../helpers/navigation_helper.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int _currentIndex = 2;
  bool isIncome = true;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    NavigationHelper.navigateTo(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Buat Transaksi',
          style: TextStyle(fontFamily: "Poppins_SemiBold", fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                // Add delete functionality
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: SizedBox(
            width: 425,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToggleIncomeExpenseWidget(isIncome: isIncome, onToggle: (value) {
                  setState(() {
                    isIncome = value;
                  });
                }),
                const SizedBox(height: 35),
                InputFormWidget(isIncome: isIncome),
                const SizedBox(height: 35),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add save functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isIncome ? const Color(0xFFB2E600) : const Color(0xFFE60000),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(fontFamily: "Poppins_SemiBold", fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
