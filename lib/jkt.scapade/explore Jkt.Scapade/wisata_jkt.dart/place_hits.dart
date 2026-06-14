import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta
final List<Map<String, String>> placeHitsList = [
  {
    'nama': 'M Bloc Space',
    'lokasi': 'Melawai, Jakarta Selatan',
    'gambar': 'assets/image/mbloc.jpeg',
    'jam': '09.00 - 22.00',
    'maps': 'https://maps.app.goo.gl/2nSxt5uZTvJNb8x58',
    'rating': '4.8',
  },
  {
    'nama': 'SCBD Park',
    'lokasi': 'Senayan, Jakarta Selatan',
    'gambar': 'assets/image/SCBD Park.jpg',
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
  {
    'nama': 'Taman Literasi',
    'lokasi':
        'Jl. Sultan Hasanuddin Dalam, RT.3/RW.1, Melawai, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12160',
    'gambar': 'assets/image/taman literasi.jpg',
    'jam': '24 jam',
    'maps': 'https://maps.app.goo.gl/2waUWap38NHekkPP6',
    'rating': '4.6',
  },
  {
    'nama': 'China Town Glodok',
    'lokasi':
        'Jl. Pancoran, RT.6/RW.6, Glodok, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11120',
    'gambar': 'assets/image/taman literasi.jpg',
    'jam': '08.00-09.00 WIB',
    'maps': 'https://maps.app.goo.gl/xRVH9BniEqWTuJk17',
    'rating': '4.6',
  },
  {
    'nama': 'Halaman Sentosa Senayan',
    'lokasi':
        'Jl. Pintu Satu Senayan. Rooftop Gedung Parkir Elevated, A, RT.1/RW.3, Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10289',
    'gambar': 'assets/image/halaman senayan.jpg',
    'jam': '08.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/dnzx8M9s8FCHs1Ay7',
    'rating': '4.5',
  },
  {
    'nama': 'Grand Waterfront Sedayu City',
    'lokasi':
        'RWMF+9F, RT.8/RW.5, Rw. Terate, Kec. Cakung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13920',
    'gambar': 'assets/image/sendayu.jpg',
    'jam': '10.00 – 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/hEcQRPpQYmVQYwL79',
    'rating': '4.6',
  },
  {
    'nama': 'Astha Distrik',
    'lokasi':
        'Jl. Senopati No.83, RT.8/RW.3, Senayan, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12190',
    'gambar': 'assets/image/astha.jpg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/iw37if748uYEp46B8',
    'rating': '4.7',
  },
  {
    'nama': 'Lapangan Softball GBK',
    'lokasi':
        'Jl. Pintu Satu Senayan, RT.1/RW.3, Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270',
    'gambar': 'assets/image/lapsoftbal.jpg',
    'jam': '06.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/vLp3iyRWNkDgtpcQ7',
    'rating': '4.8',
  },
  {
    'nama': 'Chillax',
    'lokasi':
        'Jl. Jenderal Sudirman, RT.10/RW.1, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12930',
    'gambar': 'assets/image/chilax.jpg',
    'jam': '10.00 – 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/vLp3iyRWNkDgtpcQ7',
    'rating': '4.6',
  },
  {
    'nama': 'Family Mart Trinity Tower',
    'lokasi': '〒12920 Jakarta, South Jakarta City, Setiabudi, East Kuningan',
    'gambar': 'assets/image/fm.jpg',
    'jam': '07.00 - 19.00 WIB',
    'maps': 'https://maps.app.goo.gl/4MJH8JfRvuwGAdQE6',
    'rating': '4.8',
  },
  {
    'nama': 'Skydeck Sarinah',
    'lokasi':
        'Jl. M.H. Thamrin No.11, RT.8/RW.4, Gondangdia, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10350',
    'gambar': 'assets/image/skydeck.jpg',
    'jam': '10.00 - 21.00',
    'maps': 'https://maps.app.goo.gl/9DtEbDi4GkRd54w28',
    'rating': '4.8',
  },
];

class PlaceHitsPage extends StatelessWidget {
  const PlaceHitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tempat Hits by Jkt.Scapade",
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
          itemCount: placeHitsList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = placeHitsList[index];

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
