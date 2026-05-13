import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Import sesuai project kamu
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/tempat_sejarah.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/wisata_page.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/destinasi_wisata.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/wisata_jkt.dart/place_hits.dart';

import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/kuliner_jakarta/Billys_Block_Senopati_Suites.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/kuliner_jakarta/familymart_kyai_maja.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/kuliner_jakarta/Hause_Rooftop_SetiaBudi.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Gunakan index 0 saja agar SmoothPageIndicator sinkron dengan jumlah item
  final _controllerSeputar = PageController();
  final _controllerWisata = PageController();
  final _controllerKuliner = PageController();

  // Variabel untuk navigasi bawah
  int _bottomNavIndex = 1; // Set ke 1 karena ini halaman Explore

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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

        body: ListView(
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
                      MaterialPageRoute(builder: (_) => TempatSejarah()),
                    );
                  },
                ),
                _buildCardItem(
                  context,
                  'Wisata Jakarta',
                  'assets/image/TMII.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WisataPage()),
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
                      MaterialPageRoute(builder: (_) => DestinasiWisata()),
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
                      MaterialPageRoute(builder: (_) => PlaceHitsPage()),
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
                  'Billys Block, Senopati Suites',
                  'assets/image/Billy.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BillysBlockSenopatiSuites(),
                      ),
                    );
                  },
                ),
                _buildCardItem(
                  context,
                  'familymart kyai maja',
                  'assets/image/familymart kyai maja.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FamilymartKyaiMaja()),
                    );
                  },
                ),
                _buildCardItem(
                  context,
                  'Hause Rooftop SetiaBudi',
                  'assets/image/Hause Rooftop SetiaBudi.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HauseRooftopSetiabudi(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),

        // --- BAGIAN NAVIGASI BAWAH ---
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          selectedItemColor: Colors.blue[900],
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
            // Tambahkan logika perpindahan halaman di sini jika perlu
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }

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
        const SizedBox(height: 12),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: PageView.builder(
                controller: controller,
                itemCount: items
                    .length, // Pakai items.length agar indikator titik sinkron
                itemBuilder: (_, index) {
                  return items[index];
                },
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black87,
                ),
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: items.length,
            effect: WormEffect(
              activeDotColor: Colors.blue[900]!,
              dotColor: Colors.grey.shade300,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
