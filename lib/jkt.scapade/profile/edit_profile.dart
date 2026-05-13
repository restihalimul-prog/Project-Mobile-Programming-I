import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  void _gantiPassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke halaman Ganti Password')),
    );
  }

  void _switchAkun(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke halaman Switch Akun')),
    );
  }

  void _navigateToEditProfil(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfilPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
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
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Nama Pengguna',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'email@contoh.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '+62 812-3456-7890',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  // Tombol edit profil minimalis dengan fungsi navigasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _navigateToEditProfil(context),
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Edit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout, size: 18),
                        label: const Text('Logout'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Menu List
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_outline, color: Colors.teal),
                    title: const Text("Ganti Password"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () => _gantiPassword(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.sync_alt_outlined,
                        color: Colors.teal),
                    title: const Text("Switch Akun"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () => _switchAkun(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined,
                        color: Colors.teal),
                    title: const Text("Pengaturan"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading:
                        const Icon(Icons.help_outline, color: Colors.teal),
                    title: const Text("Bantuan"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.info_outline, color: Colors.teal),
                    title: const Text("Tentang Aplikasi"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {},
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

// Halaman Edit Profil sederhana
class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implementasi simpan data profil
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui')),
                );
              },
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
