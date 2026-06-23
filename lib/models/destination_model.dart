import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationModel {
  String? id;
  String nama;
  String kategori;
  String subKategori;
  String alamat;
  String jamOperasional;
  String maps;
  String rating;
  String? deskripsi;
  String imageBase64;
  Timestamp createdAt;

  DestinationModel({
    this.id,
    required this.nama,
    required this.kategori,
    required this.subKategori,
    required this.alamat,
    required this.jamOperasional,
    required this.maps,
    required this.rating,
    this.deskripsi,
    required this.imageBase64,
    required this.createdAt,
  });

  factory DestinationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return DestinationModel(
      id: doc.id,
      nama: data['nama'] ?? '',
      kategori: data['kategori'] ?? '',
      subKategori: data['subKategori'] ?? '',
      alamat: data['alamat'] ?? '',
      jamOperasional: data['jamOperasional'] ?? '',
      maps: data['maps'] ?? '',
      rating: data['rating'] ?? '',
      deskripsi: data['deskripsi'] ?? '',
      imageBase64: data['imageBase64'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'kategori': kategori,
      'subKategori': subKategori,
      'alamat': alamat,
      'jamOperasional': jamOperasional,
      'maps': maps,
      'rating': rating,
      'deskripsi': deskripsi,
      'imageBase64': imageBase64,
      'createdAt': createdAt,
    };
  }
}
