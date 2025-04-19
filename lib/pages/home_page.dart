// File: lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'anggota_page.dart';
import 'bantuan_page.dart';
import 'bilangan_page.dart';
import 'stopwatch_page.dart';
import 'konversi_page.dart';
import 'tracking_page.dart';
import 'rekomendasi_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    AnggotaPage(),
    const BantuanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Utama"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Anggota"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Bantuan"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          title: const Text("Stopwatch"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StopwatchPage()),
            );
          },
        ),
        ListTile(
          title: const Text("Jenis Bilangan"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BilanganPage()),
            );
          },
        ),
        ListTile(
          title: const Text("Tracking Lokasi"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TrackingPage()),
            );
          },
        ),
        ListTile(
          title: const Text("Konversi Waktu"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const KonversiPage()),
            );
          },
        ),
        ListTile(
          title: const Text("Daftar Situs Rekomendasi"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RekomendasiPage()),
            );
          },
        ),
      ],
    );
  }
}
