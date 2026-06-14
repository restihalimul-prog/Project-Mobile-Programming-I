import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Timur
final List<Map<String, String>> jakartaTimurList = [
  {
    'nama': 'Nasi ulam mpok Titi Otista',
    'lokasi':
        'Jl. otto iskandardinata jatinegara jakarta timur no 90, Jl. Otto Iskandardinata No.90 1, RT.11/RW.7',
    'gambar': 'assets/image/Nasi ulam mpok Titi Otista, jaktim.jpg',
    'jam': '06.00 - 12.00 WIB',
    'maps': 'https://maps.app.goo.gl/QGwnyw5oa7dozWxg6',
    'rating': '4.5',
  },
  {
    'nama': 'Sate Padang H Ajo Manih',
    'lokasi': 'RV3J+5PC, Jl. Rawamangun Muka Barat, RT.1/RW.12, Rawamangun',
    'gambar': 'assets/image/sate padang H ajo Manih, jaktim.jpg',
    'jam': '10.00 - 12.00 WIB',
    'maps': 'https://maps.app.goo.gl/U6gHCDiVQQMVtSAy6',
    'rating': '4.0',
  },
  {
    'nama': 'Nasi Uduk Ayam Goreng Mat Lengket',
    'lokasi':
        'Jl. Bekasi Timur Raya No.5, RT.2/RW.2, klender, Kec. Pulo Gadung',
    'gambar': 'assets/image/Nasi Uduk Ayam Goreng Mat Lengket.jpg',
    'jam': '05.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/HSxg7oWLgx4aZftU9',
    'rating': '4.5',
  },
  {
    'nama': 'Teras Rumah Nenek',
    'lokasi':
        'Jl. Abdulrahman No.46, RT.14/RW.5, Cibubur, Kec. Ciracas, Jakarta',
    'gambar': 'assets/image/Teras Rumah Nenek.jpg',
    'jam': '10.00 - 23.00 WIB',
    'maps': 'https://maps.app.goo.gl/mqNJQF9dxWUoNpGx7',
    'rating': '4.8',
  },
  {
    'nama': 'Madkunyah',
    'lokasi': 'Jl. Cipinang Cempedak II No.212, RT.9/RW.6, Cipinang Cempedak',
    'gambar': 'assets/image/Madkunyah.jpg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/CLWnjcaL81BWjrwt5',
    'rating': '4.1',
  },
];

class JakartaTimur extends StatelessWidget {
  const JakartaTimur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kuliner Jakarta Timur",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        // Tombol back disesuaikan dengan tema minimalis modern
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
          itemCount: jakartaTimurList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = jakartaTimurList[index];

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
