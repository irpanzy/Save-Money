import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_apk_catatan_keuangan/controller/update_transaction_controller.dart';
import 'package:project_apk_catatan_keuangan/helpers/currency_helper.dart';
import 'package:project_apk_catatan_keuangan/helpers/transaction_helper.dart';
import 'package:project_apk_catatan_keuangan/models/transaction_models.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class TransactionSubCategory extends StatelessWidget {
  const TransactionSubCategory(
      {required this.date,
      required this.transactions,
      required this.categoryType,
      super.key});

  final String date;
  final List<TransactionModel> transactions;
  final String categoryType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(bottom: 32),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 1),
        ),
      ),
      child: Column(
        children: [columnHeader(), const SizedBox(height: 16), columnBody()],
      ),
    );
  }

  Widget columnHeader() {
    final parsedDate = DateTime.parse(date);
    final day = DateFormat('d').format(parsedDate);
    final month = DateFormat('MMM').format(parsedDate);
    final year = DateFormat('y').format(parsedDate);
    final weekday = DateFormat('EEEE').format(parsedDate);
    final totalIncome = TransactionHelper.calculateIncome(transactions);
    final totalExpense = TransactionHelper.calculateExpense(transactions);

    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(day,
                      style: TypographyStyle.h1.copyWith(
                        fontFamily: "Poppins_Extrabold",
                      )),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$month $year", style: TypographyStyle.h5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: categoryType == 'Income'
                              ? ColorStyle.primaryColor50
                              : ColorStyle.secondaryColor50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          weekday,
                          style: TypographyStyle.l3Bold.copyWith(
                            color: categoryType == 'Income'
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    CurrencyHelper.formatRupiah(totalIncome),
                    style: TypographyStyle.l1Regular
                        .copyWith(color: ColorStyle.incomeColor),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    CurrencyHelper.formatRupiah(totalExpense),
                    style: TypographyStyle.l1Regular
                        .copyWith(color: ColorStyle.expenditureColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget columnBody() {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          "Tidak ada transaksi.",
          style: TypographyStyle.p2Regular,
        ),
      );
    }

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: transactions.map((transaction) {
        return TableRow(
          children: [
            TableCell(
              child: GestureDetector(
                onTap: () {
                  Get.delete<UpdateTransactionController>();
                  Get.toNamed('/update', arguments: transaction);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "${transaction.categoryTitle}",
                        style: TypographyStyle.p2Regular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              child: GestureDetector(
                onTap: () {
                  Get.delete<UpdateTransactionController>();
                  Get.toNamed('/update', arguments: transaction);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    transaction.description,
                    style: TypographyStyle.p2Regular,
                  ),
                ),
              ),
            ),
            TableCell(
              child: GestureDetector(
                onTap: () {
                  Get.delete<UpdateTransactionController>();
                  Get.toNamed('/update', arguments: transaction);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      CurrencyHelper.formatRupiah(transaction.amount),
                      style: TypographyStyle.p2Regular.copyWith(
                        color: transaction.categoryType == 'Income'
                            ? ColorStyle.incomeColor
                            : ColorStyle.expenditureColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
