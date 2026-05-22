import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/login/slider/button_login.dart';
import 'package:project_mp1/jkt.scapade/resgistrasi/button_registrasi.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFD6ECFF), Color(0xFFB3D9FF)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
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
                        'assets/image/logo.jpeg',
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
                  "EXPLORE JAKARTA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 3,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  "Selamat Datang",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1565C0),
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Ini adalah Aplikasi Jkt.Scapade di mana kamu dapat mengeksplor Jakarta hanya dalam genggamanmu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.7,
                    fontFamily: 'Poppins',
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
      // Navigasi bawah dihapus dari sini sesuai permintaanmu
    );
  }
}
