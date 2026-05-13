import 'package:flutter/material.dart';
import 'jakartaPlaces.dart';

class WisataCard extends StatelessWidget {
  final Wisata wisata;

  const WisataCard({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // ✅ Kelengkungan kartu
      ),
      clipBehavior: Clip.antiAlias, // ✅ Wajib agar isi ikut melengkung
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              wisata.gambar,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              wisata.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(wisata.lokasi),
          ),
        ],
      ),
    );
  }
}
