import 'package:flutter/material.dart';
import 'package:project_mp1/jakartaPlaces_detail.dart';
import 'package:project_mp1/jakartaPlaceslist.dart';
import 'package:project_mp1/jakartaPlacescard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:project_mp1/jkt.scapade/profile/profile_page.dart';
import 'package:project_mp1/jkt.scapade/profile/user_data.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/explore_page.dart';
import 'package:project_mp1/jkt.scapade/beranda/flutter_map_page.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late PageController _mainPageController;
  late PageController _bottomPageController;

  final int initialPage = 1000;

  int _currentMainPage = 0;

  Timer? _autoPlayTimer;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    _mainPageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.85,
    );

    _bottomPageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.85,
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

  void _nextMainPage() {
    _mainPageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _prevMainPage() {
    _mainPageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
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
            return const Icon(
              Icons.star_border,
              color: Colors.orange,
              size: 16,
            );
          }
        }),

        const SizedBox(width: 4),

        Text(rating.toStringAsFixed(1), style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 55,
                left: 20,
                right: 20,
                bottom: 25,
              ),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF42A5F5), Color(0xFF64B5F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    padding: const EdgeInsets.all(3),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),

                    child: const CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.white,

                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Color(0xFF42A5F5),
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          UserData.nama,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          UserData.email,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          UserData.noHp,

                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('Explore Wisata'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Maps Jakarta'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapsJakartaPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile Saya'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilPage()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          "Explore Jakarta ✨",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.black87,
          ),
        ),

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),

            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilPage()),
                );
              },

              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF64B5F6),

                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
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
          physics: const BouncingScrollPhysics(),

          child: Column(
            children: [
              const SizedBox(height: 10),

              // MAIN CARD
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,

                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _mainPageController,

                      onPageChanged: (index) {
                        setState(() {
                          _currentMainPage = index % daftarWisata.length;
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
                              horizontal: 14,
                              vertical: 12,
                            ),

                            child: WisataCard(wisata: wisata),
                          ),
                        );
                      },
                    ),

                    Positioned(
                      left: 0,
                      top: 150,

                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: _prevMainPage,
                      ),
                    ),

                    Positioned(
                      right: 0,
                      top: 150,

                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: _nextMainPage,
                      ),
                    ),
                  ],
                ),
              ),

              // INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: List.generate(daftarWisata.length, (index) {
                  bool isActive = _currentMainPage == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),

                    margin: const EdgeInsets.symmetric(horizontal: 4),

                    width: isActive ? 18 : 7,
                    height: 7,

                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF64B5F6)
                          : const Color(0xFFB0BEC5),

                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 16),

              // CARD BAWAH
              SizedBox(
                height: 110,

                child: PageView.builder(
                  controller: _bottomPageController,

                  itemBuilder: (context, index) {
                    final wisata = daftarWisata[index % daftarWisata.length];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),

                      child: Card(
                        elevation: 6,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(15),
                              ),

                              child: Image.asset(
                                wisata.gambar,

                                width: 90,
                                height: double.infinity,

                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      wisata.nama,

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    buildRating(wisata.rating),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
