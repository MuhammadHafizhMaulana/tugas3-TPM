// File: lib/pages/konversi_page.dart
import 'package:flutter/material.dart';

class KonversiPage extends StatefulWidget {
  const KonversiPage({super.key});

  @override
  _KonversiPageState createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  String _error = "";

  // Fungsi untuk mengonversi tahun ke berbagai satuan waktu
  void _convertTime() {
    setState(() {
      _error = "";
      _result = "";
      try {
        final double years = double.parse(_controller.text);

        // Menghitung konversi dari tahun
        final double months = years * 12;
        final double weeks = years * 52.14;
        final double days = years * 365.25;
        final double hours = days * 24;
        final double minutes = hours * 60;
        final double seconds = minutes * 60;

        _result = 
            "Tahun: $years\n"
            "Bulan: ${months.toStringAsFixed(2)}\n"
            "Minggu: ${weeks.toStringAsFixed(2)}\n"
            "Hari: ${days.toStringAsFixed(2)}\n"
            "Jam: ${hours.toStringAsFixed(2)}\n"
            "Menit: ${minutes.toStringAsFixed(2)}\n"
            "Detik: ${seconds.toStringAsFixed(2)}";
      } catch (e) {
        _error = "Masukkan angka yang valid";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konversi Waktu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan jumlah tahun",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTime,
              child: const Text("Konversi"),
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
