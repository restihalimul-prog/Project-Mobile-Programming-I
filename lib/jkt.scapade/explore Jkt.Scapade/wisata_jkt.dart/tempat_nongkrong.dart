import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Barat
final List<Map<String, String>> tempatNongkrongList = [
  {
    'nama': 'M Bloc Space',
    'lokasi': 'Melawai, Jakarta Selatan',
    'gambar': 'assets/image/Mbloc.jpeg',
    'jam': '09.00 - 22.00',
    'maps': 'https://maps.app.goo.gl/2nSxt5uZTvJNb8x58',
    'rating': '4.8',
  },
  {
    'nama': 'SCBD Park',
    'lokasi': 'Senayan, Jakarta Selatan',
    'gambar': 'assets/image/SCBD park.jpg',
    'jam': '10.00 - 22.00',
    'maps': 'https://maps.app.goo.gl/KWwaoBbA5Hnoz65n7',
    'rating': '4.7',
  },
  {
    'nama': 'Cove at Batavia PIK',
    'lokasi': 'Pantai Indah Kapuk, Jakarta Utara',
    'gambar': 'assets/image/Cove at Batavia.jpg',
    'jam': '07.00 - 23.00',
    'maps': 'https://maps.app.goo.gl/Q4uym8TtgKEqS6aL7',
    'rating': '4.6',
  },
];

class TempatNongkrong extends StatelessWidget {
  const TempatNongkrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tempat Nongkrong by Jkt.Scapade",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // --- BACKGROUND GRADIENT SENADA ---
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFE3F2FD), Color(0xFFD6ECFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: tempatNongkrongList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = tempatNongkrongList[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GAMBAR WITH CLIPRRECT
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      place['gambar']!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAMA TEMPAT
                        Text(
                          place['nama']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),

                        const SizedBox(height: 10),

                        // LOKASI WITH ICON
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                place['lokasi']!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // JAM OPERASIONAL WITH ICON
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.blue[700],
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                place['jam']!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // RATING WITH ICON
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              place['rating']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // BUTTON MAPS
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final Uri url = Uri.parse(place['maps']!);

                              if (!await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Gagal membuka Google Maps"),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.map, size: 18),
                            label: const Text(
                              "Lihat di Maps",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
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
      ),
    );
  }
}
