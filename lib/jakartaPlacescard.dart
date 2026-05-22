import 'package:flutter/material.dart';
import 'jakartaPlaces.dart'; // Pastikan file model kamu benar

class WisataCard extends StatelessWidget {
  final Wisata wisata;

  const WisataCard({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Ganti ke Image.asset karena gambarmu ada di folder assets/image/
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Image.asset(
              wisata
                  .gambar, // Pastikan path di model cocok dengan folder assets
              fit: BoxFit.cover,
            ),
          ),

          // 2. Gunakan Padding untuk konten agar rapi
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wisata.nama,
                  maxLines: 1, // Batasi 1 baris
                  overflow: TextOverflow
                      .ellipsis, // Potong dengan ... jika terlalu panjang
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                // 3. Batasi teks lokasi agar tidak meluap ke kanan
                Text(
                  wisata.lokasi,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
