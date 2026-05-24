import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Barat
final List<Map<String, String>> jakartaBaratList = [
  {
    'nama': 'Ben Fried Chicken',
    'lokasi': 'Jl. Meruya Ilir Raya, RT.13/RW.3, Meruya Utara, Kec. Kembangan',
    'gambar': 'assets/image/Ben Fried Chicken jakbar.jpg',
    'jam': '15.00 - 18.00 WIB',
    'maps':
        'https://maps.app.goo.gl/GdSswAYg4KkjGC599', // Contoh URL maps yang valid
    'rating': '4.1',
  },
  {
    'nama': 'Ini Baru Uduk',
    'lokasi':
        'Jl. Dr. Muwardi I No.39, RT.15/RW.3, Grogol, Kec. Grogol petamburan',
    'gambar': 'assets/image/Ini Baru Uduk.jpg',
    'jam': '05.30 - 11.00 WIB',
    'maps':
        'https://maps.app.goo.gl/HcAvmSUFCEP2KzX77', // Contoh URL maps yang valid
    'rating': '3.9',
  },
  {
    'nama': 'Ketupat Gorengan Bang Hasan',
    'lokasi': 'Jl. Meruya Ilir Raya No.5 5, RT.5/RW.1, Kb. Jeruk',
    'gambar': 'assets/image/Ketupat Gorengan Bang Hasan.jpg',
    'jam': '17.00 - 00.00 WIB',
    'maps':
        'https://maps.app.goo.gl/AFzCkv6YvwPV4t7H8', // Contoh URL maps yang valid
    'rating': '4.6',
  },
  {
    'nama': 'Nongkitiam',
    'lokasi': 'Jl. Tj. Duren Utara 4 No.63 RT09, RT.9/RW.3, Tj. Duren Utara',
    'gambar': 'assets/image/Nongkitiam.jpg',
    'jam': '70.00 - 12.00 WIB',
    'maps':
        'https://maps.app.goo.gl/Axv5w3B61s93AKVP6', // Contoh URL maps yang valid
    'rating': '4.8',
  },
  {
    'nama': 'Sambel Pedas GokilZ, Grogol',
    'lokasi': 'Jl. Dr. Muwardi I No. 5A, RT.12/RW.5, Grogol',
    'gambar': 'assets/image/Sambel Pedas GokilZ, Grogol.jpg',
    'jam': '70.00 - 12.00 WIB',
    'maps':
        'https://maps.app.goo.gl/rDWSX1h35m5ApM1g7', // Contoh URL maps yang valid
    'rating': '4.9',
  },
];

class JakartaBarat extends StatelessWidget {
  const JakartaBarat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kuliner Jakarta Barat",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        // Tombol back bawaan disesuaikan warnanya
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
          itemCount: jakartaBaratList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = jakartaBaratList[index];

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
