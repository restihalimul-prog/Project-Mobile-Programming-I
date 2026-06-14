// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WisataKulinerPage extends StatelessWidget {
  final List<Map<String, String>> kulinerList = [
    {
      'nama': 'Billys Block, Senopati Suites',
      'lokasi': 'Jl. Senopati No.41, Senayan, Kec. Kebayoran Baru, Kota Jakarta Selatan',
      'gambar': 'assets/image/Billys.jpg',
    },
    {
      'nama': 'Sate Klathak Pak Pong',
      'lokasi': 'Bantul, Yogyakarta',
      'gambar': 'assets/images/sate_klathak.jpg',
    },
    {
      'nama': 'Bakpia Pathok 25',
      'lokasi': 'Jl. AIP II KS Tubun, Yogyakarta',
      'gambar': 'assets/images/bakpia25.jpg',
    },
    {
      'nama': 'Angkringan Lik Man',
      'lokasi': 'Stasiun Tugu, Yogyakarta',
      'gambar': 'assets/images/angkringan_lik_man.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wisata Kuliner")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: kulinerList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final kuliner = kulinerList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      kuliner['gambar']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      kuliner['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      kuliner['lokasi']!,
                      style: const TextStyle(color: Colors.grey),
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
