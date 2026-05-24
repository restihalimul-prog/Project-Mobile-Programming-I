import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Utara
final List<Map<String, String>> jakartaUtaraList = [
  {
    'nama': 'Ayam Goreng Serundeng Bu Heti',
    'lokasi': 'RT.13/RW.7, West Kelapa Gading, Kelapa Gading',
    'gambar': 'assets/image/Ayam Goreng Serundeng Bu Heti.jpg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/DC7RNuRfZWg7Mw6D7',
    'rating': '4.2',
  },
  {
    'nama': 'Ayam Joyo Kemayoran',
    'lokasi': 'Jl. Trembesi, Pademangan Tim., Kec. Pademangan',
    'gambar': 'assets/image/Ayam Joyo Kemayoran.jpg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/6sW5nvLax3G8jzsc7',
    'rating': '4.4',
  },
  {
    'nama': 'Ice Cream Swanie',
    'lokasi':
        'Jalan Pelepah Kuning 2 Blok WX2 No.1, RT.2/RW.16, Klp. Gading Tim',
    'gambar': 'assets/image/Ice Cream Swanie.jpg',
    'jam': '07.00 - 19.00 WIB',
    'maps': 'https://maps.app.goo.gl/aLLgnS9PK5TVuhYN6',
    'rating': '4.8',
  },
  {
    'nama': 'Meat A Meat, Tenda Taman Sunter indah',
    'lokasi':
        'Tenda Taman Sunter Indah Tenda Paling Ujung, RT.13/RW.12, Sunter Jaya, Kec. Tj. Priok',
    'gambar': 'assets/image/Meat A Meat, Tenda Taman Sunter indah.jpg',
    'jam': '05.00 - 23.00 WIB',
    'maps': 'https://maps.app.goo.gl/NwQ3WsxaYA6SjN9k9',
    'rating': '4.4',
  },
  {
    'nama': 'Stella Di Napoli Pizzeria',
    'lokasi':
        'Jl. Arwana Raya No.38 3, RT.3/RW.2, Pejagalan, Kecamatan Penjaringan',
    'gambar': 'assets/image/Stella Di Napoli Pizzeria.jpeg',
    'jam': '09.00 - 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/8UkZVDyhfHcTdsXbA',
    'rating': '4.7',
  },
];

class JakartaUtara extends StatelessWidget {
  const JakartaUtara({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kuliner Jakarta Utara",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        // Tombol back minimalis modern sesuai tema halaman lainnya
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
          itemCount: jakartaUtaraList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = jakartaUtaraList[index];

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
                  // GAMBAR
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

                        // LOKASI
                        Row(
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

                        // JAM OPERASIONAL
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.blue[700],
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              place['jam']!,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // RATING
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
