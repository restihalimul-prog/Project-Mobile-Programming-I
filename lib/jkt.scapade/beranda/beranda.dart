import 'package:flutter/material.dart';
import 'package:project_mp1/jakartaPlaces_detail.dart';
import 'package:project_mp1/jakartaPlaceslist.dart';
import 'package:project_mp1/jakartaPlacescard.dart';
import 'dart:async';
import 'package:project_mp1/jkt.scapade/profile/profile_page.dart';
import 'package:project_mp1/jkt.scapade/profile/user_data.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/explore_page.dart';
import 'package:project_mp1/jkt.scapade/beranda/maps_jakarta_page.dart';

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
  late PageController _bottomPageController;

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
            return const Icon(Icons.star_border, color: Colors.orange, size: 16);
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
            UserAccountsDrawerHeader(
              accountName: Text(UserData.nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              accountEmail: Text(UserData.email, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              currentAccountPicture: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset('assets/image/profile.jpg', fit: BoxFit.cover, width: 80, height: 80, errorBuilder: (c, e, s) => const Icon(Icons.person, color: Color(0xFF42A5F5), size: 45)),
                ),
              ),
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF42A5F5), Color(0xFF64B5F6)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
            ListTile(leading: const Icon(Icons.home), title: const Text('Beranda'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.explore), title: const Text('Explore Wisata'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage())); }),
            ListTile(leading: const Icon(Icons.favorite), title: const Text('Favorit'), onTap: () {}),
            ListTile(leading: const Icon(Icons.map), title: const Text('Maps Jakarta'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => const MapsJakartaPage())); }),
            ListTile(leading: const Icon(Icons.person), title: const Text('Profile Saya'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilPage())); }),
            ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: () {}),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Explore Jakarta ✨", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins', color: Colors.black87)),
        leading: Builder(builder: (context) => IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer())),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 12), child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilPage())), child: const CircleAvatar(radius: 18, backgroundColor: Color(0xFF64B5F6), child: Icon(Icons.person, color: Colors.white, size: 20)))),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFF8FBFF), Color(0xFFE3F2FD), Color(0xFFD6ECFF)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _mainPageController,
                    onPageChanged: (index) => setState(() => _currentMainPage = index % daftarWisata.length),
                    itemBuilder: (context, index) {
                      final wisata = daftarWisata[index % daftarWisata.length];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WisataDetailPage(wisata: wisata))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                          child: WisataCard(wisata: wisata), // Tanpa Expanded
                        ),
                      );
                    },
                  ),
                  Positioned(left: 0, top: 150, child: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: _prevMainPage)),
                  Positioned(right: 0, top: 150, child: IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: _nextMainPage)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(daftarWisata.length, (index) {
                bool isActive = _currentMainPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 18 : 7,
                  height: 7,
                  decoration: BoxDecoration(color: isActive ? const Color(0xFF64B5F6) : const Color(0xFFB0BEC5), borderRadius: BorderRadius.circular(20)),
                );
              }),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 95,
              child: PageView.builder(
                controller: _bottomPageController,
                itemBuilder: (context, index) {
                  final wisata = daftarWisata[index % daftarWisata.length];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)), child: Image.asset(wisata.gambar, width: 85, height: double.infinity, fit: BoxFit.cover)),
                          const SizedBox(width: 10),
                          Expanded( // Di sini Expanded boleh karena di dalam Row
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(wisata.nama, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                buildRating(wisata.rating),
                              ],
                            ),
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
      ),
    );
  }
}