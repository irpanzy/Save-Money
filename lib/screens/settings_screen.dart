import 'package:flutter/material.dart';
import '../helpers/navigation_helper.dart';
import '../widgets/bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Default to system theme
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'Indonesia';
  String selectedCurrency = 'Rupiah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFFCCFF00),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xFFCCFF00),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Ganti dengan path gambar Anda
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
            title: Text('Tema Gelap'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Bahasa'),
            trailing: Text(selectedLanguage),
            onTap: () async {
              String? result = await showModalBottomSheet<String>(
                context: context,
                builder: (context) =>
                    LanguageSelector(selectedLanguage: selectedLanguage),
              );
              if (result != null) {
                setState(() {
                  selectedLanguage = result;
                });
              }
            },
          ),
          ListTile(
            title: Text('Mata Uang'),
            trailing: Text(selectedCurrency),
            onTap: () async {
              String? result = await showModalBottomSheet<String>(
                context: context,
                builder: (context) =>
                    CurrencySelector(selectedCurrency: selectedCurrency),
              );
              if (result != null) {
                setState(() {
                  selectedCurrency = result;
                });
              }
            },
          ),
          ListTile(
            title: Text('Beri Penilaian'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman beri penilaian
            },
          ),
          ListTile(
            title: Text('Bantuan'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman bantuan
            },
          ),
          ListTile(
            title: Text('Tentang'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman tentang
            },
          ),
        ],
      ),
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
          title: Text('Indonesia'),
          trailing: selectedLanguage == 'Indonesia' ? Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Indonesia'),
        ),
        ListTile(
          title: Text('English'),
          trailing: selectedLanguage == 'English' ? Icon(Icons.check) : null,
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
          title: Text('Rupiah'),
          trailing: selectedCurrency == 'Rupiah' ? Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Rupiah'),
        ),
        ListTile(
          title: Text('Dollar US'),
          trailing: selectedCurrency == 'Dollar US' ? Icon(Icons.check) : null,
          onTap: () => Navigator.pop(context, 'Dollar US'),
        ),
      ],
    );
  }
}
