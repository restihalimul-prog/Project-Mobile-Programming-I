import 'dart:io'; // Diperlukan jika nanti menggunakan FileImage untuk storage lokal hp
import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/welcome_page.dart';
import 'package:project_mp1/jkt.scapade/profile/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_mp1/jkt.scapade/login/slider/login_page.dart'; // Sesuaikan folder lokasi LoginPage kamu
import 'package:project_mp1/jkt.scapade/profile/ganti_password_page.dart';
import 'package:project_mp1/jkt.scapade/profile/pengaturan_page.dart';
import 'package:project_mp1/jkt.scapade/profile/bantuan_page.dart';
import 'package:project_mp1/jkt.scapade/profile/tentang_aplikasi_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Variabel lokal untuk menampung data di UI
  String nama = '';
  String email = '';
  String nomorTelepon = '';
  String imagePath = '';

  final ImagePicker _picker = ImagePicker();

  void _switchAkun(BuildContext context) async {
    try {
      // 1. Tampilkan loading indicator saat proses keluar
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );

      // 2. Sign out dari Firebase Auth dan Google SignIn
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      // 3. Tutup loading dialog setelah selesai
      if (context.mounted) Navigator.pop(context);

      // 4. Tendang pengguna kembali ke LoginPage
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ), // Sesuaikan nama class login kamu
          (route) => false,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil keluar. Silakan gunakan akun lain!'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal ganti akun: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // AMBIL DATA KETIKA HALAMAN PERTAMA KALI DIBUKA
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Jika akun Google login aktif, pakai data otomatis dari akun Google
      nama = currentUser.displayName ?? UserData.nama;
      email = currentUser.email ?? UserData.email;
      nomorTelepon = currentUser.phoneNumber ?? UserData.noHp;
      imagePath = currentUser.photoURL ?? UserData.profileImagePath;
    } else {
      // Jika offline atau tidak lewat Google, gunakan data cadangan dari UserData
      nama = UserData.nama;
      email = UserData.email;
      nomorTelepon = UserData.noHp;
      imagePath = UserData.profileImagePath;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
        UserData.profileImagePath = pickedFile.path;
      });
    }
  }

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

  Widget _buildMenuTile(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Material(
      // Membungkus dengan Material agar efek klik muncul
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap, // Efek klik (ripple) akan muncul di sini
        child: ListTile(
          leading: Icon(
            icon,
            color: isLogout ? Colors.redAccent : Colors.blue[700],
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isLogout ? Colors.redAccent : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
          visualDensity: const VisualDensity(vertical: -1),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, indent: 20, endIndent: 20);
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (route) => false,
                );
              }
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFE3F2FD), Color(0xFFD6ECFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              // --- PROFIL CARD (KARTU PUTIH) ---
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                width: double.infinity,
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.blue.shade100,
                        // Mendukung penampilan foto URL Google maupun File Local HP
                        backgroundImage: imagePath.isNotEmpty
                            ? (imagePath.startsWith('http')
                                  ? NetworkImage(imagePath)
                                  : FileImage(File(imagePath)) as ImageProvider)
                            : null,
                        child: imagePath.isEmpty
                            ? const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // --- BAGIAN MENAMPILKAN DATA NAMA ---
                    Text(
                      nama.isEmpty ? 'Nama Tidak Ditemukan' : nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // --- BAGIAN MENAMPILKAN DATA EMAIL ---
                    Text(
                      email.isEmpty ? 'Email Tidak Ditemukan' : email,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      nomorTelepon.isEmpty || nomorTelepon == 'null'
                          ? 'Nomor Belum Diatur'
                          : nomorTelepon,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 12),

                    ElevatedButton.icon(
                      onPressed: _navigateToEditProfil,
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text('Edit Profil'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
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
                  ],
                ),
              ),

              // --- MENU LIST + LOGOUT ---
              // --- MENU LIST + LOGOUT ---
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuTile(Icons.lock_outline, "Ganti Password", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GantiPasswordPage(),
                        ),
                      );
                    }),
                    _buildDivider(),
                    _buildMenuTile(
                      Icons.sync_alt_outlined,
                      "Switch Akun",
                      () => _switchAkun(context),
                    ),
                    _buildDivider(),
                    _buildMenuTile(Icons.settings, "Pengaturan", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PengaturanPage(),
                        ),
                      );
                    }),
                    _buildDivider(),
                    _buildMenuTile(Icons.help_outline, "Bantuan", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BantuanPage(),
                        ),
                      );
                    }),
                    _buildDivider(),
                    _buildMenuTile(Icons.info_outline, "Tentang Aplikasi", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TentangAplikasiPage(),
                        ),
                      );
                    }),
                    _buildDivider(),
                    _buildMenuTile(
                      Icons.logout,
                      "Logout",
                      () => _showLogoutDialog(context),
                      isLogout: true,
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
      ),
    );
  }
}

// --- EDIT PROFILE PAGE ---
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
    nomorController = TextEditingController(
      text: widget.nomorTelepon == 'null' ? '' : widget.nomorTelepon,
    );
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
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
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
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
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
