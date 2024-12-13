import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class DayColumn extends StatelessWidget {
  const DayColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(bottom: 32),
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 1))),
      child: Column(
        children: [columnHeader(), SizedBox(height: 16), columnBody()],
      ),
    );
  }

  Widget columnHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // DATE
          Column(
            children: [
              Row(
                children: [
                  Text("30",
                      style: TypographyStyle.h1.copyWith(
                        fontFamily: "Poppins_Extrabold",
                      )),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Text("09 2024", style: TypographyStyle.h5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: ColorStyle.primaryColor60,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Kamis",
                          style: TypographyStyle.l3Bold,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          //  CASHFLOW
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Rp0",
                    style: TypographyStyle.l1Regular
                        .copyWith(color: ColorStyle.incomeColor),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Rp110.000",
                    style: TypographyStyle.l1Regular
                        .copyWith(color: ColorStyle.expenditureColor),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget columnBody() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Makanan", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Membeli Rames", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Rp100.000",
                  style: TypographyStyle.p2Regular
                      .copyWith(color: ColorStyle.expenditureColor),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Parkir", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Parkir Alfamart", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Rp1.000",
                  style: TypographyStyle.p2Regular
                      .copyWith(color: ColorStyle.expenditureColor),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Belanja", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Beli sabun mandi", style: TypographyStyle.p2Regular),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Rp20.000",
                  style: TypographyStyle.p2Regular
                      .copyWith(color: ColorStyle.expenditureColor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
