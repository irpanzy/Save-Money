import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:project_apk_catatan_keuangan/style/color_style.dart';
import 'package:project_apk_catatan_keuangan/style/text_style.dart';
import '../widgets/bottom_navbar.dart';

class SettingsScreen extends StatelessWidget {
  final int currentIndex;
  final bool isDarkMode;
  final String selectedLanguage;
  final String selectedCurrency;

  const SettingsScreen({
    super.key,
    this.currentIndex = 4,
    this.isDarkMode = false,
    this.selectedLanguage = 'Indonesia',
    this.selectedCurrency = 'Rupiah',
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: ColorStyle.primaryColor50,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/ganesha.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ganes Rahman',
                      style: TypographyStyle.l1Bold,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text("Settings", style: TypographyStyle.h4)),
              ListTile(
                leading: Icon(
                  Symbols.brightness_low,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Tema Gelap', style: TypographyStyle.l2Regular),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    _showNotEditableDialog(context);
                  },
                ),
              ),
              ListTile(
                leading: Icon(
                  Symbols.language,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Bahasa', style: TypographyStyle.l2Regular),
                trailing: Text(selectedLanguage),
                onTap: () async {
                  await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) =>
                        LanguageSelector(selectedLanguage: selectedLanguage),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Symbols.paid,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Mata Uang', style: TypographyStyle.l2Regular),
                trailing: Text(selectedCurrency),
                onTap: () async {
                  await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) =>
                        CurrencySelector(selectedCurrency: selectedCurrency),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Symbols.star,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Beri Penilaian', style: TypographyStyle.l2Regular),
                trailing: Icon(
                  Symbols.arrow_forward_ios_rounded,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                onTap: null,
              ),
              ListTile(
                leading: Icon(
                  Symbols.call,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Bantuan', style: TypographyStyle.l2Regular),
                trailing: Icon(
                  Symbols.arrow_forward_ios_rounded,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                onTap: null,
              ),
              ListTile(
                leading: Icon(
                  Symbols.error,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                title: Text('Tentang', style: TypographyStyle.l2Regular),
                trailing: Icon(
                  Symbols.arrow_forward_ios_rounded,
                  weight: 600,
                  color: ColorStyle.iconActive,
                ),
                onTap: null,
              ),
            ],
          ),
          BottomNavbar(
            currentIndex: 4,
          ),
        ],
      ),
    );
  }

  void _showNotEditableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info'),
          content: const Text(
              'Pengaturan ini tidak dapat diubah langsung dalam mode Stateless.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;

  const LanguageSelector({super.key, required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Indonesia'),
          trailing:
              selectedLanguage == 'Indonesia' ? const Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Indonesia'),
        ),
        ListTile(
          title: const Text('English'),
          trailing:
              selectedLanguage == 'English' ? const Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'English'),
        ),
      ],
    );
  }
}

class CurrencySelector extends StatelessWidget {
  final String selectedCurrency;

  const CurrencySelector({super.key, required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Rupiah'),
          trailing:
              selectedCurrency == 'Rupiah' ? const Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Rupiah'),
        ),
        ListTile(
          title: const Text('Dollar US'),
          trailing:
              selectedCurrency == 'Dollar US' ? const Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Dollar US'),
        ),
      ],
    );
  }
}
