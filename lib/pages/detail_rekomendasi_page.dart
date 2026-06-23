import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_mp1/models/destination_model.dart';
import 'package:project_mp1/pages/edit_rekomendasi_page.dart';
import 'package:project_mp1/services/destination_service.dart';

class DetailRekomendasiPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailRekomendasiPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(destination.imageBase64);

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.nama),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

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

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Image.memory(
                imageBytes,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(16),

                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),

                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        destination.nama,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "📍 ${destination.alamat}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "🕒 ${destination.jamOperasional}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "⭐ ${destination.rating}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "📝 ${destination.deskripsi ?? '-'}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.edit),

                              label: const Text("Edit"),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditRekomendasiPage(
                                      destination: destination,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.delete),

                              label: const Text("Hapus"),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),

                              onPressed: () async {
                                final bool? konfirmasi = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Hapus Data"),

                                      content: const Text(
                                        "Yakin ingin menghapus rekomendasi ini?",
                                      ),

                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },

                                          child: const Text("Batal"),
                                        ),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),

                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },

                                          child: const Text("Hapus"),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (konfirmasi == true) {
                                  await DestinationService().deleteDestination(
                                    destination.id!,
                                  );

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Data berhasil dihapus"),
                                      ),
                                    );

                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
