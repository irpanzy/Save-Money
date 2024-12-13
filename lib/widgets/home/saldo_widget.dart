import 'package:flutter/material.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../../style/color_style.dart';

class SaldoWidget extends StatefulWidget {
  const SaldoWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SaldoWidgetState createState() => _SaldoWidgetState();
}

class _SaldoWidgetState extends State<SaldoWidget> {
  bool _isNotified = false; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorStyle.primaryColor50, ColorStyle.primaryColor60],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ganesha.png'),
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hallo!', style: TypographyStyle.l3Regular),
                    Text('Ganesha Rahman', style: TypographyStyle.l1Bold),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNotified = !_isNotified;
                    });
                  },
                  child: Icon(
                    _isNotified
                        ? Icons.notifications
                        : Icons.notifications_none,
                    color: ColorStyle.iconActive,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Saldo anda', style: TypographyStyle.l2Regular),
                  Text('150.000 IDR',
                      style: TypographyStyle.h1
                          .copyWith(fontSize: 40, fontFamily: "Poppins_bold")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
