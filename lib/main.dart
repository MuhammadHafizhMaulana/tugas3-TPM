// File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/anggota_page.dart';
import 'pages/bantuan_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(startPage: isLoggedIn ? const Home() : const LoginPage()));
}

class MyApp extends StatelessWidget {
  final Widget startPage;
  const MyApp({super.key, required this.startPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kelompok',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: startPage,
    );
  }
}