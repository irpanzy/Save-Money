import 'package:flutter/material.dart';

class InputNameScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCFF00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Siapa Nama Anda',
              style: TextStyle(fontSize: 24, fontFamily: "Poppins_SemiBold"),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama anda',
                  hintStyle:
                      TextStyle(fontSize: 14, fontFamily: "Poppins_Regular"),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nama tidak boleh kosong!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                textInputAction:
                    TextInputAction.done, // Tombol Enter di keyboard
              ),
            ),
          ],
        ),
      ),
    );
  }
}
