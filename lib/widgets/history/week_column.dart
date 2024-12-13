import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';

class WeekColumn extends StatelessWidget {
  const WeekColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorStyle.borderBlack,
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorStyle.primaryColor60,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Minggu 1",
                  style: TypographyStyle.l3Bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text("1.10", style: TypographyStyle.h5),
                  Text("-", style: TypographyStyle.h5),
                  Text("7.10", style: TypographyStyle.h5),
                ],
              )
            ],
          ),
          Text("Rp50.000",
              style: TypographyStyle.l1Bold.copyWith(
                color: ColorStyle.incomeColor,
              )),
          Text("Rp90.000",
              style: TypographyStyle.l1Bold.copyWith(
                color: ColorStyle.expenditureColor,
              ))
        ],
      ),
    );
  }
}
