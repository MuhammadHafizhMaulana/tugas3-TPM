// File: lib/pages/anggota_page.dart
import 'package:flutter/material.dart';

class AnggotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftar anggota kelompok
    final List<Map<String, String>> members = [
      {"name": "Muhammad Hafizh Maulana", "nim": "123210194", "kelas": "IF-B", "image": "assets/hafizh.jpg"},
      {"name": "Gustansyah Dwi Putra Sujanto", "nim": "123220210", "kelas": "IF-B", "image": "assets/gustansyah.jpeg"},
      {"name": "Dimas Proboningrat", "nim": "123220211", "kelas": "IF-B", "image": "assets/dimas.jpeg"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Data Kelompok")),
      body: ListView.builder(
        itemCount: members.length,
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
                  members[index]["image"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                members[index]["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NIM: ${members[index]["nim"]!}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Kelas: ${members[index]["kelas"]!}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
