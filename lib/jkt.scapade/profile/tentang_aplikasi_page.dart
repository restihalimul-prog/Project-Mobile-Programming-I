import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFEAF5FF),
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi', 
          style: TextStyle(
            color: Colors.white, // Ganti warna biru ke Putih
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 0,
        
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // BAGIAN FOTO/LOGO
                Container(
                  width: 140,
                  height: 140,
                  padding: const EdgeInsets.all(6),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/logo.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                
                // NAMA & VERSI
                Text(
                  'Jkt.Scapade',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF42A5F5),
                  ),
                ),
                const Text(
                  'Versi 1.0.0',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                
                const Divider(color: Colors.black12, height: 40),
                
                // DESKRIPSI
                const Text(
                  'Aplikasi ini dikembangkan untuk memudahkan pengguna dalam mengelola akun mereka dengan desain yang modern dan responsif.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                ),
                
                const SizedBox(height: 30),
                
                // FOOTER
                const Text(
                  '© 2026 Seapade Inc. All Rights Reserved.',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}