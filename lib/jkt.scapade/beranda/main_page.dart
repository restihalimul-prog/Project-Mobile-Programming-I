import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/beranda.dart';
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/explore_page.dart';
import 'package:project_mp1/jkt.scapade/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  List<Widget> pageList = [Beranda(), ExplorePage(), ProfilPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: [
          barItem(Icons.home, "Beranda"),
          barItem(Icons.search, "Explore"),
          barItem(Icons.account_circle_outlined, "Profil"),
        ],
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData iconData, String title) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: title);
  }
}
