import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCFF00),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: const Color(0xFFCCFF00),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/images/ganesha.png'), // Ganti dengan path gambar Anda
                ),
                SizedBox(height: 10),
                Text(
                  'Ganes Rahman',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Tema Gelap'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                _showNotEditableDialog(context);
              },
            ),
          ),
          ListTile(
            title: const Text('Bahasa'),
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
            title: const Text('Mata Uang'),
            trailing: Text(selectedCurrency),
            onTap: () async {
              await showModalBottomSheet<String>(
                context: context,
                builder: (context) =>
                    CurrencySelector(selectedCurrency: selectedCurrency),
              );
            },
          ),
          const ListTile(
            title: Text('Beri Penilaian'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: null, // Navigasi ke halaman beri penilaian
          ),
          const ListTile(
            title: Text('Bantuan'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: null, // Navigasi ke halaman bantuan
          ),
          const ListTile(
            title: Text('Tentang'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: null, // Navigasi ke halaman tentang
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: (index) => NavigationHelper.navigateTo(index, context),
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

  const LanguageSelector({required this.selectedLanguage});

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

  const CurrencySelector({required this.selectedCurrency});

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
