import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/destination_model.dart';
import '../../services/destination_service.dart';
import '../../services/storage_service.dart';
import 'dart:convert';

class TambahRekomendasiPage extends StatefulWidget {
  const TambahRekomendasiPage({super.key});

  @override
  State<TambahRekomendasiPage> createState() => _TambahRekomendasiPageState();
}

class _TambahRekomendasiPageState extends State<TambahRekomendasiPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final jamController = TextEditingController();
  final mapsController = TextEditingController();
  final ratingController = TextEditingController();
  final deskripsiController = TextEditingController();

  String? selectedKategori;
  String? selectedSubKategori;

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  final DestinationService destinationService = DestinationService();

  final StorageService storageService = StorageService();

  final Map<String, List<String>> kategoriData = {
    "Destinasi Wisata": [
      "Destinasi Wisata",
      "Place Hits",
      "Tempat Nongkrong",
      "Tempat Sejarah",
    ],

    "Kuliner Jakarta": [
      "Jakarta Barat",
      "Jakarta Pusat",
      "Jakarta Selatan",
      "Jakarta Timur",
      "Jakarta Utara",
    ],
  };

  Future<void> pilihGambar() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> simpanData() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Silakan pilih foto")));
      return;
    }

    try {
      print("Kategori = $selectedKategori");
      print("SubKategori = $selectedSubKategori");
      print("Nama = ${namaController.text}");
      // Upload foto ke Firebase Storage
      String imageBase64 = base64Encode(await selectedImage!.readAsBytes());
      print("Panjang Base64 = ${imageBase64.length}");
      DestinationModel destination = DestinationModel(
        nama: namaController.text.trim(),
        kategori: selectedKategori!,
        subKategori: selectedSubKategori!,
        alamat: alamatController.text.trim(),
        jamOperasional: jamController.text.trim(),
        maps: mapsController.text.trim(),
        rating: ratingController.text.trim(),
        deskripsi: deskripsiController.text.trim(),
        imageBase64: imageBase64,
        createdAt: Timestamp.now(),
      );

      print(destination.toMap());

      await destinationService.createDestination(destination);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data berhasil ditambahkan")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error : $e")));
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    jamController.dispose();
    mapsController.dispose();
    ratingController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Tambah Rekomendasi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF42A5F5),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFE3F2FD), Color(0xFFD6ECFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Tempat",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tempat wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: selectedKategori,

                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),

                  items: kategoriData.keys.map((kategori) {
                    return DropdownMenuItem(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedKategori = value;
                      selectedSubKategori = null;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return "Pilih kategori";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: selectedSubKategori,

                  decoration: const InputDecoration(
                    labelText: "Subkategori",
                    border: OutlineInputBorder(),
                  ),

                  items: (kategoriData[selectedKategori] ?? [])
                      .map(
                        (sub) => DropdownMenuItem(value: sub, child: Text(sub)),
                      )
                      .toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedSubKategori = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return "Pilih subkategori";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: alamatController,
                  decoration: const InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Alamat wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: jamController,
                  decoration: const InputDecoration(
                    labelText: "Jam Operasional",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jam operasional wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: ratingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Rating",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Rating wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: deskripsiController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi (Opsional)",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: pilihGambar,
                  icon: const Icon(Icons.image),
                  label: const Text("Pilih Foto"),
                ),

                const SizedBox(height: 10),

                if (selectedImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      selectedImage!,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: simpanData,
                    child: const Text("Simpan", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
