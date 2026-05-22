import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bantuan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF42A5F5),
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ 
              Color(0xFFFDFEFF),
              Color(0xFFEAF5FF),
              Color(0xFFDCEEFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                "Pusat Bantuan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ada yang bisa kami bantu? Pilih pertanyaan di bawah ini:",
              ),
              const SizedBox(height: 20),

              // Daftar FAQ menggunakan ExpansionTile
              _buildFAQItem(
                "Bagaimana cara mengganti password?",
                "Anda bisa pergi ke halaman Profil, lalu klik menu 'Ganti Password' dan ikuti instruksi yang ada.",
              ),
              _buildFAQItem(
                "Apakah saya bisa menggunakan banyak akun?",
                "Ya, Anda bisa menggunakan fitur 'Switch Akun' di halaman profil untuk berpindah antar akun dengan mudah.",
              ),
              _buildFAQItem(
                "Bagaimana cara menghapus akun?",
                "Silakan hubungi tim dukungan kami melalui menu 'Tentang Aplikasi' untuk bantuan penghapusan akun permanen.",
              ),
              _buildFAQItem(
                "Apakah aplikasi ini aman?",
                "Keamanan data Anda adalah prioritas kami. Kami menggunakan enkripsi standar industri untuk melindungi informasi Anda.",
              ),

              const SizedBox(height: 40),

              // Tombol Hubungi Kami
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Logika untuk buka Email/WhatsApp
                  },
                  icon: const Icon(Icons.support_agent, color: Colors.blue),
                  label: const Text("Hubungi CS Kami"),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk setiap pertanyaan FAQ
  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer, style: const TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
