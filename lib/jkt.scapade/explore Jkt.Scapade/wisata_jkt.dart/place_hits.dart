import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta
final List<Map<String, String>> placeHitsList = [
  {
    'nama': 'M Bloc Space',
    'lokasi': 'Melawai, Jakarta Selatan',
    'gambar': 'assets/image/Mbloc.jpeg', 
    'jam': '09.00 - 22.00',
    'maps': 'https://maps.app.goo.gl/2nSxt5uZTvJNb8x58',
    'rating': '4.8'
  },
  {
    'nama': 'SCBD Park',
    'lokasi': 'Senayan, Jakarta Selatan',
    'gambar': 'assets/image/SCBD park.jpg',
    'jam': '10.00 - 22.00',
    'maps': 'https://maps.app.goo.gl/KWwaoBbA5Hnoz65n7',
    'rating': '4.7'
  },
  {
    'nama': 'Cove at Batavia PIK',
    'lokasi': 'Pantai Indah Kapuk, Jakarta Utara',
    'gambar': 'assets/image/Cove at Batavia.jpg',
    'jam': '07.00 - 23.00',
    'maps': 'https://maps.app.goo.gl/Q4uym8TtgKEqS6aL7',
    'rating': '4.6'
  },
];

class PlaceHitsPage extends StatelessWidget {
  const PlaceHitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tempat Hits Nongkrong"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: placeHitsList.length,
        itemBuilder: (context, index) {
          final place = placeHitsList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Tempat
                Image.asset(
                  place['gambar']!,
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
                      Text(place['nama']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("Lokasi: ${place['lokasi']}"),
                      Text("Jam Operasional: ${place['jam']}"),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          Text(" ${place['rating']}"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri url = Uri.parse(place['maps']!);
                          if (!await launchUrl(url)) {
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Gagal membuka link Maps")),
                            );
                          }
                        },
                        icon: const Icon(Icons.map),
                        label: const Text("Lihat di Maps"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
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