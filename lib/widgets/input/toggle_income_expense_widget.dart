import 'package:flutter/material.dart';
import '../../style/color_style.dart';

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
          width: 280,
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: ColorStyle.primaryTextWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorStyle.borderBlackLow),
            boxShadow: const [
              BoxShadow(
                color: ColorStyle.Shadow,
                blurRadius: 6,
                offset: Offset(0, 6),
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
                    decoration: BoxDecoration(
                      color: isIncome
                          ? ColorStyle.primaryColor60
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
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
                          ? ColorStyle
                              .secondaryColor50 // Merah untuk Pengeluaran
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Pengeluaran',
                      style: TextStyle(
                        fontFamily: "Poppins_Medium",
                        fontSize: 16,
                        color: !isIncome
                            ? ColorStyle.primaryTextWhite
                            : ColorStyle.primaryTextBlack,
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
