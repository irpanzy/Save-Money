import 'package:flutter/material.dart';

class ToggleIncomeExpenseWidget extends StatefulWidget {
  final bool isIncome;
  final ValueChanged<bool> onToggle;

  const ToggleIncomeExpenseWidget(
      {Key? key, required this.isIncome, required this.onToggle})
      : super(key: key);

  @override
  _ToggleIncomeExpenseWidgetState createState() =>
      _ToggleIncomeExpenseWidgetState();
}

class _ToggleIncomeExpenseWidgetState extends State<ToggleIncomeExpenseWidget> {
  late bool isIncome;

  @override
  void initState() {
    super.initState();
    isIncome = widget.isIncome;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 280, // Lebar container tombol
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isIncome = true;
                    });
                    widget.onToggle(isIncome); // Notifikasi perubahan status
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isIncome
                          ? const Color(0xFFB2E600) // Hijau untuk Pemasukan
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Pemasukan',
                      style: TextStyle(
                        fontFamily: "Poppins_Medium",
                        fontSize: 16,
                        color: isIncome ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isIncome = false;
                    });
                    widget.onToggle(isIncome); // Notifikasi perubahan status
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: !isIncome
                          ? const Color(0xFFE60000) // Merah untuk Pengeluaran
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Pengeluaran',
                      style: TextStyle(
                        fontFamily: "Poppins_Medium",
                        fontSize: 16,
                        color: !isIncome ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}