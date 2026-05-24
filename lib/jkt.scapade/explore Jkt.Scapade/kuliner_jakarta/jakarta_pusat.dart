import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Pusat
final List<Map<String, String>> jakartaPusatList = [
  {
    'nama': 'Bubur Cikini H.R Sulaeman',
    'lokasi': 'Jl. Cisadane No.121 9, RT.9/RW.4, Cikini, Kec. Menteng',
    'gambar': 'assets/image/Bubur Cikini H.R Sulaeman.jpg',
    'jam': '06.00 - 11.00 WIB',
    'maps': 'https://maps.app.goo.gl/hP9HXzdEhPNDuVFS9',
    'rating': '4.1',
  },
  {
    'nama': 'Nasi Goreng Kambing Kebon Sirih Sejak 1958',
    'lokasi':
        'Jl. Kebon Sirih Barat I Dalam No.9, RT.3/RW.2, Kb. Sirih, Kec. Menteng',
    'gambar':
        'assets/image/Nasi Goreng Kambing Kebon sirih sejak 1958, jakpuss.jpg',
    'jam': '11.00 - 23.00 WIB',
    'maps': 'https://maps.app.goo.gl/8qoLqXkSiFZ3hm9C9',
    'rating': '4.6',
  },
  {
    'nama': 'Ketan Susu Kemayoran 1958',
    'lokasi': 'Jl. Kemayoran Gempol Jl. Garuda No.11, RT.11/RW.8, Kemayoran',
    'gambar': 'assets/image/Ketan Susu Kemayoran 1958, jakpus.jpg',
    'jam': '24 jam',
    'maps': 'https://maps.app.goo.gl/g6GMY5jNLcyQWxNE8',
    'rating': '4.6',
  },
  {
    'nama': 'Aldis Burger',
    'lokasi': 'Jl. Cemp. Putih Tim. 12 No.8A, RT.2/RW.7, Cemp. Putih Timur',
    'gambar': 'assets/image/aldis burger jakpus.jpg',
    'jam': '09.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/sha67rSqvwDGt8Pz6',
    'rating': '4.6',
  },
  {
    'nama': 'NOODLEMAN',
    'lokasi': 'Jl. Cemp. Putih Tengah XI No.1, RT.3/RW.5, Cemp. Putih',
    'gambar': 'assets/image/NOODLEMAN.jpg',
    'jam': '11.00 - 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/Na98rYeniiDgNKM3A',
    'rating': '4.7',
  },
  {
    'nama': 'Roemah Kuliner',
    'lokasi': 'Jl. Pangeran Diponegoro No.21, RT.1/RW.1, Pegangsaan',
    'gambar': 'assets/image/Roemah Kuliner.jpg',
    'jam': '11.00 - 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/jVWPvjZ4Z2m2RPWFA',
    'rating': '4.4',
  },
];

class JakartaPusat extends StatelessWidget {
  const JakartaPusat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kuliner Jakarta Pusat",
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
          itemCount: jakartaPusatList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = jakartaPusatList[index];

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
