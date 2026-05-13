import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Destinasi Wisata Jakarta
final List<Map<String, String>> destinasiWisataList = [
  {
    'nama': 'Taman Mini Indonesia Indah',
    'lokasi': 'Jakarta Timur',
    'gambar': 'assets/image/TMII.jpg', // Menggunakan aset yang sudah ada di folder kamu
    'jam': '06.00 - 20.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=TMII',
    'rating': '4.8'
  },
  {
    'nama': 'Taman Margasatwa Ragunan',
    'lokasi': 'Pasar Minggu, Jakarta Selatan',
    'gambar': 'assets/image/ragunan.jpg', // Menggunakan aset yang sudah ada di folder kamu
    'jam': '07.00 - 16.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Ragunan',
    'rating': '4.7'
  },
  {
    'nama': 'Ancol Taman Impian',
    'lokasi': 'Pademangan, Jakarta Utara',
    'gambar': 'assets/image/Ancol.jpg', // Ganti dengan gambar Ancol jika sudah ada
    'jam': '06.00 - 24.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Ancol',
    'rating': '4.6'
  },
];

class DestinasiWisata extends StatelessWidget {
  const DestinasiWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinasi Wisata Jakarta"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: destinasiWisataList.length,
        itemBuilder: (context, index) {
          final destinasi = destinasiWisataList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  destinasi['gambar']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.broken_image, size: 100),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destinasi['nama']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("Lokasi: ${destinasi['lokasi']}"),
                      Text("Jam Operasional: ${destinasi['jam']}"),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          Text(" ${destinasi['rating']}"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri url = Uri.parse(destinasi['maps']!);
                          if (!await launchUrl(url)) {
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Gagal membuka link Maps")),
                            );
                          }
                        },
                        icon: const Icon(Icons.map),
                        label: const Text("Lihat di Maps"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
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