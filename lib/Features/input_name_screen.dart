import 'package:flutter/material.dart';

class InputNameScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCFF00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Siapa Nama Anda',
              style: TextStyle(fontSize: 24, fontFamily: "Poppins_SemiBold"),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama anda',
                  hintStyle: TextStyle(fontSize: 14, fontFamily: "Poppins_Regular"),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Color(0xFFCCFF00),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontFamily: "Poppins_Regular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
