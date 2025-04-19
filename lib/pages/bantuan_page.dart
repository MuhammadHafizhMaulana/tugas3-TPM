// File: lib/pages/bantuan_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bantuan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cara Menggunakan Aplikasi:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("1. Login menggunakan username dan password."),
            const Text("2. Navigasi lewat menu bawah."),
            const Text("3. Gunakan fitur-fitur utama sesuai kebutuhan."),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => logout(context),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
