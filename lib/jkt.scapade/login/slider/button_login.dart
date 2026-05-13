import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/main_page.dart';
// Pastikan path ini benar mengarah ke LoginPage

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Berpindah ke halaman LoginPage saat tombol ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Warna latar tombol
        foregroundColor: Colors.white, // Warna teks tombol
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
