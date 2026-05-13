import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/login/slider/button_login.dart';
import 'package:project_mp1/jkt.scapade/resgistrasi/button_registrasi.dart';

// Import halaman explore agar bisa pindah lewat menu bawah
import 'package:project_mp1/jkt.scapade/explore Jkt.Scapade/explore_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Index 0 karena ini halaman Beranda/Welcome
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // Avatar Profil
                Center(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpeg', // Pastikan folder 'images' atau 'image' benar
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Selamat Datang",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Ini adalah Aplikasi Jkt.Scapade di mana kamu dapat mengeksplor Jakarta hanya dalam genggamanmu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 50),

                // Tombol Registrasi
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.65,
                    height: 48,
                    child: const ButtonRegistrasi(),
                  ),
                ),

                const SizedBox(height: 15),

                // Tombol Login
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.65,
                    height: 48,
                    child: const ButtonLogin(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // --- TAMBAHKAN INI DI BAWAH ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Jika klik icon Explore (index 1), pindah ke ExplorePage
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ExplorePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
