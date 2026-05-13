import 'package:flutter/material.dart';
import 'jakartaPlaces.dart';

class WisataDetailPage extends StatelessWidget {
  final Wisata wisata;

  const WisataDetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar utama
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.network(
                wisata.gambar,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nama Wisata
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                wisata.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Rating + Jam Operasional
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    wisata.rating.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Icon(Icons.access_time, color: Colors.blueGrey, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    wisata.jamBuka,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Lokasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      wisata.lokasi,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                wisata.deskripsi,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
