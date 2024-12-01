import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  String selectedLanguage = "Indonesia";
  String selectedCurrency = "Rupiah";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.greenAccent,
          elevation: 0,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                "Ganes Rahman",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text("Tema Gelap"),
            value: isDarkTheme,
            onChanged: (value) {
              setState(() {
                isDarkTheme = value;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Bahasa"),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: "Indonesia", child: Text("Indonesia")),
                DropdownMenuItem(value: "Inggris", child: Text("Inggris")),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text("Mata Uang"),
            trailing: DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: "Rupiah", child: Text("Rupiah")),
                DropdownMenuItem(value: "Dolar US", child: Text("Dolar US")),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.star),
            title: Text("Beri Penilaian"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text("Bantuan"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text("Tentang"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Logika navigasi sesuai index
        },
      ),
    );
  }
}
