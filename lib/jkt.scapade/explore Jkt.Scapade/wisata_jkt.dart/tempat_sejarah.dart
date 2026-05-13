import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import ini untuk fungsi Maps kamu



  // Data List Wisata Sejarah Jakarta (Mengikuti struktur data yang kamu mau)
  final List<Map<String, String>> wisataSejarahList = [
    {
      'nama': 'Museum Fatahillah',
      'lokasi': 'Kota Tua, Jakarta Barat',
      'gambar': 'assets/image/Museum Fatahillah.jpg', // Pastikan gambar ada di folder assets kamu
      'jam': '09.00 - 15.00',
      'maps': 'https://www.google.com/maps/search/?api=1&query=Museum+Fatahillah',
      'rating': '4.8'
    },
    {
      'nama': 'Monumen Nasional (Monas)',
      'lokasi': 'Gambir, Jakarta Pusat',
      'gambar': 'assets/image/Monas.jpg', // Menggunakan aset yang sudah kamu punya
      'jam': '08.00 - 16.00',
      'maps': 'https://www.google.com/maps/search/?api=1&query=Monas',
      'rating': '4.9'
    },
    {
      'nama': 'Pelabuhan Sunda Kelapa',
      'lokasi': 'Penjaringan, Jakarta Utara',
      'gambar': 'assets/image/Pelabuhan Sunda Kelapa.jpg',
      'jam': '24 Jam',
      'maps': 'https://www.google.com/maps/search/?api=1&query=Sunda+Kelapa',
      'rating': '4.5'
    },
  ];

  class TempatSejarah extends StatelessWidget {
  const TempatSejarah({super.key}); // Gunakan format ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Sejarah Jakarta"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: wisataSejarahList.length,
        itemBuilder: (context, index) {
          final wisata = wisataSejarahList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Wisata
                Image.asset(
                  wisata['gambar']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.broken_image, size: 100), // Antisipasi jika gambar tidak ketemu
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wisata['nama']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("Lokasi: ${wisata['lokasi']}"),
                      Text("Jam Operasional: ${wisata['jam']}"),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          Text(" ${wisata['rating']}"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri url = Uri.parse(wisata['maps']!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch ${wisata['maps']}');
                          }
                        },
                        icon: const Icon(Icons.map),
                        label: const Text("Lihat di Maps"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}