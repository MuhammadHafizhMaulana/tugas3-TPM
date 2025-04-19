// File: lib/pages/bilangan_page.dart
import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  _BilanganPageState createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  String _error = "";

  // Fungsi untuk memeriksa apakah bilangan tersebut adalah bilangan prima
  bool isPrime(BigInt n) {
    if (n <= BigInt.from(1)) return false;
    for (BigInt i = BigInt.from(2); i * i <= n; i += BigInt.one) {
      if (n % i == BigInt.zero) return false;
    }
    return true;
  }

  // Fungsi untuk memeriksa apakah bilangan tersebut adalah bilangan cacah (non-negative)
  bool isCacah(BigInt n) {
    return n >= BigInt.zero;
  }

  // Fungsi untuk memeriksa apakah bilangan tersebut bulat
  bool isBulat(BigInt n) {
    return true; // Semua BigInt adalah bilangan bulat
  }

  // Fungsi untuk memeriksa apakah bilangan tersebut positif atau negatif
  String isPositifNegatif(BigInt n) {
    if (n > BigInt.zero) {
      return "Positif";
    } else if (n < BigInt.zero) {
      return "Negatif";
    } else {
      return "Nol";
    }
  }

  // Fungsi untuk memeriksa bilangan berdasarkan input
  void checkBilangan() {
    setState(() {
      _error = "";
      _result = "";
      try {
        final input = BigInt.parse(_controller.text);
        _result = "Bilangan: ${input.toString()}\n";

        // Periksa apakah bilangan tersebut prima
        _result += isPrime(input) ? "Bilangan Prima\n" : "Bukan Bilangan Prima\n";

        // Periksa apakah bilangan tersebut cacah
        _result += isCacah(input) ? "Bilangan Cacah\n" : "Bukan Bilangan Cacah\n";

        // Bilangan bulat (karena BigInt selalu bulat)
        _result += "Bilangan Bulat\n";

        // Periksa apakah bilangan tersebut positif/negatif
        _result += "Bilangan ${isPositifNegatif(input)}";
      } catch (e) {
        _error = "Masukkan angka yang valid.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jenis Bilangan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Bilangan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkBilangan,
              child: const Text("Periksa Bilangan"),
            ),
            const SizedBox(height: 20),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (_result.isNotEmpty)
              Text(
                _result,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
