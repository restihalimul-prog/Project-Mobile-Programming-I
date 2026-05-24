import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Tempat Hits Jakarta Selatan
final List<Map<String, String>> jakartaSelatanList = [
  {
    'nama': 'Ayam Becek Legendaris',
    'lokasi':
        'Blok M Hub, Jl. Sultan Hasanudin No.109 Lt 1, RT.3/RW.1, Melawai',
    'gambar': 'assets/image/Ayam Becek Legendaris, jaksel.jpg',
    'jam': '11.00 - 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/wpa6EQ7dTo4MkuSB9',
    'rating': '4.3',
  },
  {
    'nama': 'Ayam Taliwang As,ad',
    'lokasi': 'Jl. Cipete Raya No.12, RT.5/RW.4, Cipete Selatan',
    'gambar': 'assets/image/Ayam Taliwang As,ad, cipete, jaksel.jpg',
    'jam': '09.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/HsxoS3crdiZ5egKp8',
    'rating': '4.5',
  },
  {
    'nama': 'Sop Sapi Minarwati',
    'lokasi': 'Jl. Tebet Timur Dalam Raya No.39, RT.1/RW.11, Tebet Timur',
    'gambar': 'assets/image/Sop Sapi Minarwati, jaksel.jpg',
    'jam': '08.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/T8zTX6uFfY8ndVcV8',
    'rating': '4.6',
  },
  {
    'nama': 'Tananan Mie Bakso',
    'lokasi': 'Jalan Mohammad Kahfi 1, Ciganjur, Jagakarsa',
    'gambar': 'assets/image/Tananan Mie Bakso, Jagaraksa, jaksel.jpg',
    'jam': '08.00 - 17.00 WIB',
    'maps': 'https://maps.app.goo.gl/Z8ewJcvMMY77aNhi9',
    'rating': '4.7',
  },
  {
    'nama': 'Warung ijo x Dapu Mandalika Nipah Jakaerta Selatan',
    'lokasi': 'Jalan Mohammad Kahfi 1, Ciganjur, Jagakarsa',
    'gambar':
        'assets/image/Warung ijo x Dapu Mandalika Nipah Jakaerta Selatan.jpeg',
    'jam': '10.00 - 22.00 WIB',
    'maps': 'https://maps.app.goo.gl/9Fjc9uN5E7CVusYW7',
    'rating': '4.6',
  },
  {
    'nama': 'Warung Jepang Abusan Kuningan',
    'lokasi': 'Jl. Karet Karya, RT.5/RW.5, Kuningan, Karet Kuningan',
    'gambar': 'assets/image/Warung Jepang Abusan Kuningan Jaksel.jpg',
    'jam': '05.00 - 12.00 WIB',
    'maps': 'https://maps.app.goo.gl/zrc6ffrUif1Z6xhf9',
    'rating': '4.4',
  },
  {
    'nama': 'Warung MJS',
    'lokasi': 'Jl. Setia Budi Tengah No.11, RT.1/RW.1, Kuningan',
    'gambar': 'assets/image/Warung MJS.jpg',
    'jam': '11.00 - 21.30 WIB',
    'maps': 'https://maps.app.goo.gl/NspMuL2UHn5MpAQRA',
    'rating': '4.5',
  },
  {
    'nama': 'Warung Sop Iga & Soto Betawi Ismail',
    'lokasi':
        'Jl. Bunga Flamboyan No.50, RT.5/RW.2, Cipete Sel., Kec. Cilandak',
    'gambar': 'assets/image/Warung Sop Iga & Soto Betawi Ismail.jpg',
    'jam': '11.00 - 15.00 WIB',
    'maps': 'https://maps.app.goo.gl/ccLLR2VmCW6TuaFX6',
    'rating': '4.5',
  },
];

class JakartaSelatan extends StatelessWidget {
  const JakartaSelatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kuliner Jakarta Selatan",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        // Tombol back minimalis sesuai tema halaman lainnya
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
          itemCount: jakartaSelatanList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final place = jakartaSelatanList[index];

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
