import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Barat
final List<Map<String, String>> tempatNongkrongList = [
  {
    'nama': 'Jurnal Risa Coffe',
    'lokasi': 'Mal Atrium Senen',
    'gambar': 'assets/image/Jurnal Risa Coffe.jpg',
    'jam': '09.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/B5eKDSuuDgmduwqz9',
    'rating': '4.5',
  },
  {
    'nama': 'Kedai Malabar',
    'lokasi':
        'Jl. Cipinang Jaya Raya No.27B, RT.15/RW.4, Cipinang Besar Sel., Kecamatan Jatinegara, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13420',
    'gambar': 'assets/image/Kedai Malabar.jpg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/umMyMoCykhykEoMc9',
    'rating': '4.6',
  },
  {
    'nama': 'Kedai Tirai',
    'lokasi':
        'Jl. Daksinapati Tim. A No.4, RT.6/RW.14, Rawamangun, Kec. Pulo Gadung, Kota Jakarta Timur',
    'gambar': 'assets/image/Kedai Tirai.jpg',
    'jam': '11.00 - 20.00 WIB',
    'maps': 'https://maps.app.goo.gl/fvF2j34tJ44ZG3Ms6',
    'rating': '4.8',
  },
  {
    'nama': 'Kopi Nako Daur Baur',
    'lokasi': 'Senayan Park, Jl. Gerbang Pemuda No.3 Lantai LG-59, RT.1/RW.3',
    'gambar': 'assets/image/Kopi Nako Daur Baur.jpg',
    'jam': '08.00 - 23.00 WIB',
    'maps': 'https://maps.app.goo.gl/2HNjDg338KDWPNe67',
    'rating': '4.8',
  },
  {
    'nama': 'Kopikina Tebet',
    'lokasi':
        'Jl. Tebet Timur Dalam Raya No.43, RT.1/RW.8, Tebet Tim., Kec. Tebet, Kota Jakarta Selatan',
    'gambar': 'assets/image/Kopikina Tebet.jpg',
    'jam': '07.00 - 02.00 WIB',
    'maps': 'https://maps.app.goo.gl/H6KdzUQiX4VUEMhQ7',
    'rating': '4.5',
  },
  {
    'nama': 'La Trobe',
    'lokasi': 'Jl. BDN II No.56a, RT.8/RW.13, Cilandak Bar., Kec. Cilandak',
    'gambar': 'assets/image/La Trobe.jpg',
    'jam': '08.00 - 17.30 WIB',
    'maps': 'https://maps.app.goo.gl/fcsQMqmfMRdMYZzi7',
    'rating': '4.7',
  },
  {
    'nama': 'Lomma',
    'lokasi': 'Jl. Darmawangsa IV No.6, RT.1/RW.1, Pulo, Kec. Kby. Baru',
    'gambar': 'assets/image/Lomma.jpeg',
    'jam': '12.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/2imhhuWKSnoHJLr78',
    'rating': '4.5',
  },
  {
    'nama': 'Middle Coffe Sunter',
    'lokasi':
        'Jl. agung tengah 4 raya blok f1 no.8B, RT.1/RW.12, Sunter Agung, Tanjung Priok',
    'gambar': 'assets/image/Middle Coffee sunter.jpg',
    'jam': '07.00 - 20.00 WIB',
    'maps': 'https://maps.app.goo.gl/QF5eDEGxbU77gtE38',
    'rating': '4.6',
  },
  {
    'nama': 'Nawa Everyday',
    'lokasi':
        'Jl. Pertengahan No.7, RT.6/RW.7, Cijantung, Kec. Ps. Rebo, Kota Jakarta Timur',
    'gambar': 'assets/image/Nawa Everyday.jpg',
    'jam': '09.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/c3kcsKi3oLWL2H4YA',
    'rating': '4.8',
  },
  {
    'nama': 'Nika Book Cafe Kelapa Gading',
    'lokasi':
        'Komplek Graha, Jl. Boulevard Timur Summarecon Blok ND No.23, RT.13/RW.18, Kelapa, Gading Timur',
    'gambar': 'assets/image/Nika Book Cafe kelapa gading.jpg',
    'jam': '11.00 - 23.00 WIB',
    'maps': 'https://maps.app.goo.gl/tkhuRSTKLBR14hkz5',
    'rating': '4.8',
  },
  {
    'nama': 'Odistry',
    'lokasi': 'Jl. Cemp. Putih Tengah I, RT.9/RW.5, East Cempaka Putih',
    'gambar': 'assets/image/Odistry.jpg',
    'jam': '09:00 - 23:00 WIB',
    'maps': 'https://maps.app.goo.gl/jxkSV3YgVU4dvh8t9',
    'rating': '4.8',
  },
  {
    'nama': 'Oma Coffe Brewers',
    'lokasi': 'Jl. KH Muhasim Raya IV No.30, RT.13/RW.6, Cilandak Barat',
    'gambar': 'assets/image/oma coffee brewers.jpg',
    'jam': '07.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/f7fJ86Vt65c8yb9t6',
    'rating': '4.8',
  },
  {
    'nama': 'Roetara Coffee & Eatery',
    'lokasi': 'Jl. Warakas Raya No.68, RT.9/RW.8, Warakas',
    'gambar': 'assets/image/Roetara coffee & eatery.jpg',
    'jam': '12.00 - 00.00 WIB',
    'maps': 'https://maps.app.goo.gl/SDQSi6niF7Vn24Qt7',
    'rating': '4.7',
  },
  {
    'nama': 'Simetri Home Coffee Roasters',
    'lokasi':
        'Jl. Metro Kencana V No.9, RT.2/RW.15, Pd. Pinang, Kec. Kby. Lama',
    'gambar': 'assets/image/simetri home coffee roasters.jpg',
    'jam': '08.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/c2N3JiUb1xRtygcc7',
    'rating': '4.6',
  },
  {
    'nama': 'Smoking Barrels Atelier',
    'lokasi':
        'Jl. Cipete Raya.5-14, RT.5/RW.4, Cipete Sel, RT.5/RW.4, Kota, Kec. Cilandak',
    'gambar': 'assets/image/Smoking Barrels Atelier.jpeg',
    'jam': '07.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/iS4xPpv9R5XEHF6q8',
    'rating': '4.9',
  },
  {
    'nama': 'Tanatap Meruya',
    'lokasi': 'Jalan Jalur 20 Blok 30 Nomor 19, Meruya Utara, Kembangan',
    'gambar': 'assets/image/tanatap meruya.jpg',
    'jam': '08.00 - 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/mMmkGgki8TjWG9bP7',
    'rating': '4.8',
  },
  {
    'nama': 'Temu SCBD',
    'lokasi': 'Jl. Jend. Sudirman kav 52-53, RT.5/RW.3, Senayan',
    'gambar': 'assets/image/Temu SCBD.jpg',
    'jam': '07.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/GW4tj5SN4SMokhN58',
    'rating': '4.4',
  },
  {
    'nama': 'Teru',
    'lokasi': 'Jl. Barito I No.19, RT.4/RW.1, Kramat Pela, Kec. Kby. Baru',
    'gambar': 'assets/image/Teru.jpg',
    'jam': '07.30 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/QjwtP8i5RXBvKMX37',
    'rating': '4.8',
  },
  {
    'nama': 'Work Coffee Lebak Bulus',
    'lokasi': 'Jl. H. Ipin No.81A, RT.4/RW.8, Lb. Bulus, Kec. Cilandak',
    'gambar': 'assets/image/work coffee lebak bulus.jpg',
    'jam': '07.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/Vp5p3AEZgfQAuRrV7',
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
