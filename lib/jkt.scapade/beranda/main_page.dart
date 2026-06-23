import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/beranda.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/explore_page.dart';
import 'package:project_mp1/pages/tambah_rekomendasi_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  final List<Widget> pageList = [
    Beranda(),
    ExplorePage(),
    TambahRekomendasiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        currentIndex: pageIndex,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },

        items: [
          barItem(Icons.home, "Beranda"),
          barItem(Icons.search, "Explore"),
          barItem(Icons.add_circle, "Tambah"),
        ],
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData iconData, String title) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: title);
  }
}
