import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import ini untuk fungsi Maps kamu

// Data List Wisata Sejarah Jakarta (Mengikuti struktur data yang kamu mau)
final List<Map<String, String>> wisataSejarahList = [
  {
    'nama': 'Museum Fatahillah',
    'lokasi': 'Kota Tua, Jakarta Barat',
    'gambar':
        'assets/image/Museum Fatahillah.jpg', // Pastikan gambar ada di folder assets kamu
    'jam': '09.00 - 15.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Museum+Fatahillah',
    'rating': '4.8',
  },
  {
    'nama': 'Monumen Nasional (Monas)',
    'lokasi': 'Gambir, Jakarta Pusat',
    'gambar':
        'assets/image/Monas.jpg', // Menggunakan aset yang sudah kamu punya
    'jam': '08.00 - 16.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Monas',
    'rating': '4.9',
  },
  {
    'nama': 'Pelabuhan Sunda Kelapa',
    'lokasi': 'Penjaringan, Jakarta Utara',
    'gambar': 'assets/image/Pelabuhan Sunda Kelapa.jpg',
    'jam': '24 Jam',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Sunda+Kelapa',
    'rating': '4.5',
  },
  {
    'nama': 'Museum Kebangkitan Nasional',
    'lokasi':
        'Jl. Dr. Abdul Rahman Saleh No.26, RT.4/RW.5, Senen, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10410',
    'gambar': 'assets/image/museum kebangkitan.jpg',
    'jam': '08.00 - 16.00 WIB',
    'maps': 'https://maps.app.goo.gl/2kWvCsZEeLBvEhJy6',
    'rating': '4.7',
  },
  {
    'nama': 'Museum Seni Keramik',
    'lokasi':
        'Jl. Dr. Abdul Rahman Saleh No.26, RT.4/RW.5, Senen, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10410',
    'gambar': 'assets/image/museum keramik.jpg',
    'jam': '08.00 - 16.00 WIB',
    'maps': 'https://maps.app.goo.gl/5B68KZasvDjfqJX19',
    'rating': '4.7',
  },
  {
    'nama': 'Gedung Arsip Nasional',
    'lokasi':
        'Jl. Gajah Mada No.111 1, RT.1/RW.1, Krukut, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11140',
    'gambar': 'assets/image/gedung arsip.jpg',
    'jam':
        'Senin – Jumat: 08.00 – 16.00 WIB, Sabtu – Minggu: 08.00 – 12.00 WIB, Hari Libur Nasional: Tutup',
    'maps': 'https://maps.app.goo.gl/YeMhSwQxEWhmReaE6',
    'rating': '4.5',
  },
  {
    'nama': 'Lubang Buaya',
    'lokasi': 'kelurahan di Kecamatan Cipayung, Jakarta Timur.',
    'gambar': 'assets/image/lubang buaya.jpg',
    'jam': '08.00 - 15.30 WIB',
    'maps': 'https://maps.app.goo.gl/sCcuSaqqRKUSiyMt9',
    'rating': '4.5',
  },
  {
    'nama': 'Museum Sumpah Pemuda',
    'lokasi':
        'Jl. Kramat Raya No.106, RT.2/RW.9, Kwitang, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10420',
    'gambar': 'assets/image/museum sumpah pemuda.jpg',
    'jam': '08.00 – 16.00 WIB',
    'maps': 'https://maps.app.goo.gl/T6tNW2Gsvumshveh9',
    'rating': '4.7',
  },
  {
    'nama': 'Rumah Jendral Besar A.H Nasution',
    'lokasi':
        'Jl. Teuku Umar No.40, RT.1/RW.1, Gondangdia, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10350',
    'gambar': 'assets/image/rumah jendral.png',
    'jam': 'Selasa hingga Minggu pukul 08.00 - 14.00 WIB',
    'maps': 'https://maps.app.goo.gl/Arh1vf1hWiP8pq169',
    'rating': '4.8',
  },
  {
    'nama': 'Wisma Habibie & Ainun',
    'lokasi':
        'Jl. Patra Kuningan XIII No.5, RT.6/RW.4, Kuningan Tim., Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12950',
    'gambar': 'assets/image/wisma.jpg',
    'jam':
        'setiap Rabu, Sabtu, dan Minggu dengan waktu operasional pukul 10.00 – 18.00 WIB',
    'maps': 'https://maps.app.goo.gl/uAzzb3tYPKJc7Yky7',
    'rating': '4.9',
  },
  {
    'nama': 'Antara Heritage Center',
    'lokasi':
        'Jl. Antara No.59 2, RT.2/RW.1, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710',
    'gambar': 'assets/image/heritage.jpeg',
    'jam': '09.00 - 19.00 WIB',
    'maps': 'https://maps.app.goo.gl/N1Zk7qUHmjpMwVSb7',
    'rating': '4.9',
  },
  {
    'nama': 'Gedung A.A Maramis',
    'lokasi':
        'Jl. Lap. Banteng Timur, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710',
    'gambar': 'assets/image/maramis.jpg',
    'jam': '09.00 - 19.00 WIB',
    'maps': 'https://maps.app.goo.gl/ZdcT5R4RcG6v4ua16',
    'rating': '4.8',
  },
  {
    'nama': 'Museum Bank Indonesia',
    'lokasi':
        'Jl. Pintu Besar Utara No.3, RT.4/RW.6, Pinangsia, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11110',
    'gambar': 'assets/image/bi.jpg',
    'jam': 'Selasa hingga Minggu pukul 08.00 – 15.30 WIB',
    'maps': 'https://maps.app.goo.gl/JsRbpkj5S1xotkPR9',
    'rating': '4.7',
  },
  {
    'nama': 'Masjid Ramlie Musofa',
    'lokasi':
        'Jl. Danau Sunter Selatan No.12C - 14A, RT.13/RW.16, Sunter Agung, Kec. Tj. Priok, Jkt Utara, Daerah Khusus Ibukota Jakarta 14350',
    'gambar': 'assets/image/masjid.jpg',
    'jam':
        'Setiap hari mulai waktu Subuh hingga malam hari sekitar pukul 21.30 WIB',
    'maps': 'https://maps.app.goo.gl/74nEF76Yh5sdtDk66',
    'rating': '4.8',
  },
  {
    'nama': 'Museum Taman Prasasti',
    'lokasi':
        'Jl. Tanah Abang I No.1, RT.11/RW.8, Petojo Sel., Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10160',
    'gambar': 'assets/image/prasasti.jpg',
    'jam': 'Selasa hingga Minggu pukul 09.00 - 15.00 WIB',
    'maps': 'https://maps.app.goo.gl/As1cy4kG3psVEAj89',
    'rating': '4.6',
  },
  {
    'nama': 'Candra Naya',
    'lokasi':
        'Jl. Gajah Mada No.RT.3, RT.2/RW.5, Glodok, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11120',
    'gambar': 'assets/image/candra.jpg',
    'jam': 'Selasa hingga Minggu mulai pukul 09.00 hingga 16.30 WIB',
    'maps': 'https://maps.app.goo.gl/aVa1ifHXpMpwcmZWA',
    'rating': '4.6',
  },
];

class TempatSejarah extends StatelessWidget {
  const TempatSejarah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wisata Sejarah Jakarta",
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
          itemCount: wisataSejarahList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final wisata = wisataSejarahList[index];

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
                      wisata['gambar']!,
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
                        // NAMA WISATA
                        Text(
                          wisata['nama']!,
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
                                wisata['lokasi']!,
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
                                wisata['jam']!,
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
                              wisata['rating']!,
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
                              final Uri url = Uri.parse(wisata['maps']!);

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
