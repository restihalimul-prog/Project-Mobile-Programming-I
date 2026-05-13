import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/welcome_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Simulasi data profil
  String nama = 'Nama Pengguna';
  String email = 'email@contoh.com';
  String nomorTelepon = '+62 812-3456-7890';
  
  void _navigateToEditProfil() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilPage(
          nama: nama,
          email: email,
          nomorTelepon: nomorTelepon,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        nama = result['nama'] ?? nama;
        email = result['email'] ?? email;
        nomorTelepon = result['nomorTelepon'] ?? nomorTelepon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Akun Saya',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 75,
                     backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      email,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      nomorTelepon,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _navigateToEditProfil,
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text('Edit Profil'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Menu List + Logout
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_outline, color: Colors.teal),
                    title: const Text("Ganti Password"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.sync_alt_outlined, color: Colors.teal),
                    title: const Text("Switch Akun"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined, color: Colors.teal),
                    title: const Text("Pengaturan"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.teal),
                    title: const Text("Bantuan"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.info_outline, color: Colors.teal),
                    title: const Text("Tentang Aplikasi"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.teal),
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Konfirmasi Logout'),
                          content: const Text('Apakah Anda yakin ingin logout?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Versi 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

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

  void _simpanProfil() {
    Navigator.pop(context, {
      'nama': namaController.text.trim(),
      'email': emailController.text.trim(),
      'nomorTelepon': nomorController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nomorController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _simpanProfil,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
