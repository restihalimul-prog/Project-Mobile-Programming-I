import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/kuliner_jakarta/jakarta_barat.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/kuliner_jakarta/jakarta_pusat.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/kuliner_jakarta/jakarta_selatan.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/kuliner_jakarta/jakarta_timur.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/kuliner_jakarta/jakarta_utara.dart';

// Import sesuai project kamu
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/tempat_sejarah.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/destinasi_wisata.dart';
import 'package:project_mp1/jkt.scapade/explore%20Jkt.Scapade/wisata_jkt.dart/place_hits.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _controllerSeputar = PageController();
  final _controllerWisata = PageController();
  final _controllerKuliner = PageController();

  @override
  void dispose() {
    _controllerSeputar.dispose();
    _controllerWisata.dispose();
    _controllerKuliner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Hai ... Mau Explore Jakarta Hari Ini?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ),

        // --- BAGIAN BACKGROUND GRADIENT DIKEMBALIKAN DI SINI ---
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
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              _buildSwipeSection(
                context,
                title: "Sekitar Jakarta",
                subtitle: "Informasi menarik tentang kota Jakarta",
                controller: _controllerSeputar,
                items: [
                  _buildCardItem(
                    context,
                    'Tempat Sejarah',
                    'assets/image/sejarah.jpeg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TempatSejarah(),
                        ),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Destinasi Wisata',
                    'assets/image/Ancol.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DestinasiWisata(),
                        ),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Place Hits',
                    'assets/image/SCBD Park.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PlaceHitsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              _buildSwipeSection(
                context,
                title: "Kuliner Populer",
                subtitle: "Rekomendasi kuliner di Jakarta",
                controller: _controllerKuliner,
                items: [
                  _buildCardItem(
                    context,
                    'Kuliner Jakarta Barat',
                    'assets/image/jakarta_barat.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const JakartaBarat()),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Kuliner Jakarta Utara',
                    'assets/image/jakarta_utara.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const JakartaUtara()),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Kuliner Jakarta Pusat',
                    'assets/image/jakarta_pusat.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const JakartaPusat()),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Kuliner Jakarta Timur',
                    'assets/image/jakarta_timur.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const JakartaTimur()),
                      );
                    },
                  ),
                  _buildCardItem(
                    context,
                    'Kuliner Jakarta Selatan',
                    'assets/image/jakarta_selatan.jpg',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JakartaSelatan(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pendukung untuk Swipe Section
  Widget _buildSwipeSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required PageController controller,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Column(children: items),
      ],
    );
  }

  // Widget pendukung untuk Card Item
  Widget _buildCardItem(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
