// File: lib/pages/tracking_page.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  String _locationMessage = "Lokasi belum diperoleh";
  bool _isTracking = false;

  // Fungsi untuk mendapatkan lokasi terkini
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Memeriksa apakah layanan lokasi diaktifkan
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Layanan lokasi tidak aktif.";
      });
      return;
    }

    // Memeriksa izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Izin lokasi ditolak";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Izin lokasi permanen ditolak";
      });
      return;
    }

    // Mendapatkan lokasi terkini dengan geolocator 14.x menggunakan locationSettings
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,  // Presisi tinggi
      distanceFilter: 10,               // Jarak minimum untuk update lokasi
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    setState(() {
      _locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  // Fungsi untuk melacak lokasi secara real-time
  void _startTracking() {
    _isTracking = true;
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,  // Presisi tinggi
        distanceFilter: 10,               // Jarak minimum untuk update lokasi
      ),
    ).listen((Position position) {
      setState(() {
        _locationMessage =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    });
  }

  // Fungsi untuk menghentikan pelacakan lokasi
  void _stopTracking() {
    setState(() {
      _isTracking = false;
      _locationMessage = "Pelacakan lokasi dihentikan";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking Lokasi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text("Dapatkan Lokasi Terkini"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isTracking ? null : _startTracking,
              child: const Text("Mulai Pelacakan Lokasi"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_isTracking ? null : _stopTracking,
              child: const Text("Hentikan Pelacakan Lokasi"),
            ),
            const SizedBox(height: 40),
            Text(
              _locationMessage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
