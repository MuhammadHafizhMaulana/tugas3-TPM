// File: lib/pages/stopwatch_page.dart
import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int _milliseconds = 0; // Menyimpan waktu dalam milidetik
  Timer? _timer;
  bool _isRunning = false;
  bool _isStopped = false;

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _isStopped = false;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds += 10;
      });
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _isStopped = true;
    });
    _timer?.cancel();
  }

  void _resetStopwatch() {
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
      _isStopped = false;
    });
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final int totalSeconds = _milliseconds ~/ 1000;
    final String minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final String seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    final String milliseconds = ((_milliseconds % 1000) ~/ 10).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text("Stopwatch")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$minutes:$seconds:$milliseconds",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startStopwatch,
                  child: const Text("Start"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : null,
                  child: const Text("Stop"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: !_isRunning && _isStopped ? _resetStopwatch : null,
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
