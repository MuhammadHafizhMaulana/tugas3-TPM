// File: lib/pages/stopwatch_page.dart
import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int _seconds = 0; // Menyimpan waktu dalam detik
  late Timer _timer; // Menyimpan Timer untuk kontrol
  bool _isRunning = false; // Menyimpan status stopwatch (apakah sedang berjalan)
  bool _isStopped = false; // Menyimpan status apakah stopwatch dihentikan

  // Fungsi untuk memulai stopwatch
  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _isStopped = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  // Fungsi untuk menghentikan stopwatch
  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _isStopped = true;
    });
    _timer.cancel();
  }

  // Fungsi untuk mereset stopwatch
  void _resetStopwatch() {
    setState(() {
      _seconds = 0; // Mengatur ulang detik ke 0
      _isRunning = false;
      _isStopped = false;
    });
    _timer.cancel(); // Menghentikan timer
  }

  @override
  Widget build(BuildContext context) {
    final String minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final String seconds = (_seconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text("Stopwatch")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$minutes:$seconds",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startStopwatch,  // Tombol Start hanya aktif jika stopwatch belum berjalan
                  child: const Text("Start"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : null,  // Tombol Stop hanya aktif jika stopwatch berjalan
                  child: const Text("Stop"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: !_isRunning && _isStopped ? _resetStopwatch : null,  // Tombol Reset hanya aktif setelah berhenti
                  child: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
