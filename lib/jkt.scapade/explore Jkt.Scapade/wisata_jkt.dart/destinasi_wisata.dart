import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Data List Destinasi Wisata Jakarta
final List<Map<String, String>> destinasiWisataList = [
  {
    'nama': 'Taman Mini Indonesia Indah',
    'lokasi': 'Jakarta Timur',
    'gambar':
        'assets/image/tmmi.jpg', // Menggunakan aset yang sudah ada di folder kamu
    'jam': '06.00 - 20.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=TMII',
    'rating': '4.8',
  },
  {
    'nama': 'Taman Margasatwa Ragunan',
    'lokasi': 'Pasar Minggu, Jakarta Selatan',
    'gambar':
        'assets/image/ragunan.jpg', // Menggunakan aset yang sudah ada di folder kamu
    'jam': '07.00 - 16.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Ragunan',
    'rating': '4.7',
  },
  {
    'nama': 'Ancol Taman Impian',
    'lokasi': 'Pademangan, Jakarta Utara',
    'gambar': 'assets/image/Ancol.jpg',
    'jam': '06.00 - 24.00',
    'maps': 'https://www.google.com/maps/search/?api=1&query=Ancol',
    'rating': '4.6',
  },
  {
    'nama': 'City Tour Jakarta',
    'lokasi': 'Halte IRTI Monas dan Plaza Sarinah',
    'gambar': 'assets/image/City Tour Jakarta.jpeg',
    'jam': '16.00 – 17.00 WIB (tergantung jadwal weekend atau weekday).',
    'maps': 'https://maps.app.goo.gl/gvFPsnrvdPfx9YMD7',
    'rating': '4.8',
  },
  {
    'nama': 'Faunaland',
    'lokasi':
        'Halte IRTI Monas dan Plaza SarinahEcovention Building – Ecopark, Jl. Lodan Raya No. 7, Ancol, Pademangan, Jakarta Utara 14430.',
    'gambar': 'assets/image/Faunaland.jpg',
    'jam': '09:00 - 16:30 WIB',
    'maps': 'https://maps.app.goo.gl/FLbem9SLLC1wzBE6A',
    'rating': '4.5',
  },
  {
    'nama': 'Galeri Nasional Indonesia',
    'lokasi':
        'Jl. Medan Merdeka Timur No. 14, RT.6/RW.1, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110.',
    'gambar': 'assets/image/galeri nasional.jpg',
    'jam': '10.00 – 18.00 WIB',
    'maps': 'https://maps.app.goo.gl/aY1GzLwjqXi8MgQK9',
    'rating': '4.7',
  },
  {
    'nama': 'Jakarta Aquarium Safari',
    'lokasi':
        'Jalan Letjen S. Parman Kavling 28, Tanjung Duren Selatan, Grogol Petamburan, Jakarta Barat.',
    'gambar': 'assets/image/jakarta aquarium.jpg',
    'jam': '10.00 – 21.00 WIB',
    'maps': 'https://maps.app.goo.gl/Xrod5MpQ2Sfa99yu7',
    'rating': '4.6',
  },
  {
    'nama': 'Kidzania',
    'lokasi':
        'Jl. Jend. Sudirman Kav. 52-53, RT.5/RW.3, Senayan, Kebayoran Baru, Jakarta Selatan 12190.',
    'gambar': 'assets/image/Kidzania.jpg',
    'jam': '09.00 – 19.00 WIB',
    'maps': 'https://maps.app.goo.gl/CXogq7UfThxdu4D69',
    'rating': '4.6',
  },
  {
    'nama': 'Museum Nasional Indonesia',
    'lokasi':
        'Jalan Medan Merdeka Barat No. 12, Gambir, Kecamatan Gambir, Jakarta Pusat',
    'gambar': 'assets/image/museum nasional.jpg',
    'jam': '08.00 – 20.00 WIB',
    'maps': 'https://maps.app.goo.gl/D3nxHJdukK2KkYGP8',
    'rating': '4.7',
  },
  {
    'nama': 'Semesta Gallery',
    'lokasi':
        'Jalan Taman Sari I Nomor 77, Lebak Bulus, Cilandak, Jakarta Selatan.',
    'gambar': 'assets/image/semesta gallery.jpg',
    'jam': '10.00 – 20.00 WIB',
    'maps': 'https://maps.app.goo.gl/ivb291YbxyFnAC8e6',
    'rating': '4.7',
  },
  {
    'nama': 'Upat Thamrin Nine',
    'lokasi':
        'Autograph Tower, lantai dasar dan akses utamanya masuk melalui Lantai 2 Agora Mall, Jalan M.H. Thamrin No.10, Kebon Melati, Kecamatan Tanah Abang, Jakarta Pusat.',
    'gambar': 'assets/image/Up at Thamrin Nine.jpg',
    'jam': '10.00 – 16.00 WIB (Normal Hour) dan 16.00 – 22.00 WIB (Peak Hour).',
    'maps': 'https://maps.app.goo.gl/M7x1y7qU8LN7rbnz5',
    'rating': '4.7',
  },
  {
    'nama': 'Taman Langsat',
    'lokasi':
        'Jl. Barito, Jl. Gandaria Tengah III, RT.1/RW.1, Kramat Pela, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12130',
    'gambar': 'assets/image/taman langsat.jpg',
    'jam': '24 Jam (setiap hari)',
    'maps': 'https://maps.app.goo.gl/uewrZnto8yufjTQh9',
    'rating': '4.6',
  },
];

class DestinasiWisata extends StatelessWidget {
  const DestinasiWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Destinasi Wisata Jakarta",
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
          itemCount: destinasiWisataList.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          itemBuilder: (context, index) {
            final destinasi = destinasiWisataList[index];

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
                      destinasi['gambar']!,
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
                        // NAMA DESTINASI
                        Text(
                          destinasi['nama']!,
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
                                destinasi['lokasi']!,
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
                                destinasi['jam']!,
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
                              destinasi['rating']!,
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
                              final Uri url = Uri.parse(destinasi['maps']!);

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
