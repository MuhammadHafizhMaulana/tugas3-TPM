// File: lib/pages/rekomendasi_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RekomendasiPage extends StatefulWidget {
  const RekomendasiPage({super.key});

  @override
  _RekomendasiPageState createState() => _RekomendasiPageState();
}

class _RekomendasiPageState extends State<RekomendasiPage> {
  // Daftar situs rekomendasi
  final List<Map<String, String>> sites = [
    {
      "title": "Space Elevator",
      "url": "https://neal.fun/space-elevator/",
      "image": "../assets/space.jpeg",
    },
    {
      "title": "Deep Sea",
      "url": "https://neal.fun/deep-sea/",
      "image": "../assets/deepsea.jpeg",
    },
    {
      "title": "Google",
      "url": "https://www.google.com",
      "image": "../assets/google_logo.png",
    },
  ];

  // Fungsi untuk membuka URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);  // Mengonversi string menjadi Uri
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);  // Meluncurkan URL dengan launchUrl()
    } else {
      throw 'Tidak bisa membuka URL: $url';
    }
  }

  // Tombol favorite untuk setiap situs
  bool _isFavorite(int index) {
    return _favoriteSites.contains(sites[index]["url"]);
  }

  void _toggleFavorite(int index) {
    setState(() {
      if (_isFavorite(index)) {
        _favoriteSites.remove(sites[index]["url"]);
      } else {
        _favoriteSites.add(sites[index]["url"]!);
      }
    });
  }

  // Daftar situs yang di-mark sebagai favorite
  final Set<String> _favoriteSites = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rekomendasi Situs")),
      body: ListView.builder(
        itemCount: sites.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  sites[index]["image"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                sites[index]["title"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                sites[index]["url"]!,
                style: const TextStyle(fontSize: 14, color: Colors.blue),
              ),
              trailing: IconButton(
                icon: Icon(
                  _isFavorite(index) ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite(index) ? Colors.red : null,
                ),
                onPressed: () => _toggleFavorite(index),
              ),
              onTap: () => _launchURL(sites[index]["url"]!),
            ),
          );
        },
      ),
    );
  }
}
