import 'package:flutter/material.dart';
import 'package:project_mp1/jakartaPlaces_detail.dart';
import 'package:project_mp1/jakartaPlaceslist.dart';
import 'package:project_mp1/jakartaPlacescard.dart';
import 'dart:async';
import 'package:project_mp1/jkt.scapade/profile/profile_page.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late PageController _mainPageController;
  final int initialPage = 1000;

  int _currentMainPage = 0;

  Timer? _autoPlayTimer;

  void _nextMainPage() {
    _mainPageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void _prevMainPage() {
    _mainPageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  late PageController _bottomPageController;

  @override
  void initState() {
    super.initState();

    _mainPageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.85,
    );

    _bottomPageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.65,
    );

    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_bottomPageController.hasClients) {
        _bottomPageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    _bottomPageController.dispose();
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  Widget buildRating(double rating) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;
    return Row(
      children: [
        ...List.generate(5, (index) {
          if (index < fullStars) {
            return const Icon(Icons.star, color: Colors.orange, size: 16);
          } else if (index == fullStars && halfStar) {
            return const Icon(Icons.star_half, color: Colors.orange, size: 16);
          } else {
            return const Icon(Icons.star_border,
                color: Colors.orange, size: 16);
          }
        }),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Hai ... Mau Explore Jakarta Hari Ini?",
    style: TextStyle(fontSize: 16),
  ),
  leading: const Icon(Icons.menu), // Tombol menu di kiri
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          // Navigasi ke halaman profile saat lingkaran di-klik
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilPage()),
          );
        },
        child: const CircleAvatar(
          backgroundColor: Color(0xFFE3F2FD), // Warna biru muda sesuai gambar
          child: Icon(Icons.person, color: Colors.blue), // Munculkan ikon orang agar jelas itu tombol profile
        ),
      ),
    ),
  ],
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 0,
),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // Swipe Utama
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _mainPageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentMainPage =
                          index % daftarWisata.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    final wisata =
                        daftarWisata[index % daftarWisata.length];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WisataDetailPage(wisata: wisata),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(25),
                                child: WisataCard(wisata: wisata),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Tombol kiri
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: _prevMainPage,
                  ),
                ),

                // Tombol kanan
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: _nextMainPage,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // 🔥 DOT INDICATOR (BIAR GA WARNING)
          SizedBox(
            height: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(daftarWisata.length, (index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3),
                  width: _currentMainPage == index ? 10 : 6,
                  height: _currentMainPage == index ? 10 : 6,
                  decoration: BoxDecoration(
                    color: _currentMainPage == index
                        ? Colors.blue
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 8),

          // Swipe Bawah
          Expanded(
            flex: 1,
            child: PageView.builder(
              controller: _bottomPageController,
              itemBuilder: (context, index) {
                final wisata =
                    daftarWisata[index % daftarWisata.length];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.horizontal(
                                  left: Radius.circular(12)),
                          child: Image.network(
                            wisata.gambar,
                            width: 100,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            wisata.nama,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 12.0),
                          child: buildRating(wisata.rating),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}