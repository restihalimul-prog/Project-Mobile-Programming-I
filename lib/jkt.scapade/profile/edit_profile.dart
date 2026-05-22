import 'package:flutter/material.dart';

class EditProfilPage extends StatefulWidget {
  final String nama;
  final String email;
  final String nomorTelepon;

  const EditProfilPage({
    super.key,
    required this.nama,
    required this.email,
    required this.nomorTelepon,
  });

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController nomorController;

  // Warna gradasi yang disamakan dengan file ButtonLogin.dart
  final List<Color> loginGradient = const [Color(0xFF42A5F5), Color(0xFF1E88E5)];

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.nama);
    emailController = TextEditingController(text: widget.email);
    nomorController = TextEditingController(text: widget.nomorTelepon);
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    nomorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan warna biru tua yang senada dengan gradasi
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: Colors.white,
      ),
      body: Container(
        // Latar belakang gradasi halus untuk memberi kesan bersih
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: namaController,
                    decoration: const InputDecoration(labelText: 'Nama', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: nomorController,
                    decoration: const InputDecoration(labelText: 'Nomor Telepon', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 30),
                  
                  // Tombol Simpan dengan Gradasi yang sama persis seperti di ButtonLogin
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(colors: loginGradient),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: () {
                        // Logika simpan di sini
                        Navigator.pop(context, {
                          'nama': namaController.text,
                          'email': emailController.text,
                          'nomorTelepon': nomorController.text
                        });
                      },
                      child: const Text(
                        'Simpan', 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}