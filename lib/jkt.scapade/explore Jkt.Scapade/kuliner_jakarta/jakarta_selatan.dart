import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:project_mp1/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mp1/pages/detail_rekomendasi_page.dart';

// Data List Tempat Hits Jakarta Selatan

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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('destinations')
              .where('kategori', isEqualTo: 'Kuliner Jakarta')
              .where('subKategori', isEqualTo: 'Jakarta Selatan')
              .snapshots(),

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("Belum ada data destinasi"));
            }

            final documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              itemBuilder: (context, index) {
                final destination = DestinationModel.fromFirestore(
                  documents[index],
                );

                Uint8List imageBytes = base64Decode(destination.imageBase64);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailRekomendasiPage(destination: destination),
                      ),
                    );
                  },

                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),

                          child: Image.memory(
                            imageBytes,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                destination.nama,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text("📍 ${destination.alamat}"),

                              const SizedBox(height: 8),

                              Text("🕒 ${destination.jamOperasional}"),

                              const SizedBox(height: 8),

                              Text("⭐ ${destination.rating}"),

                              const SizedBox(height: 8),

                              Text(
                                "📝 ${destination.deskripsi}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
