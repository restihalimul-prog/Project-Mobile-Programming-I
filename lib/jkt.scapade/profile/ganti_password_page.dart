import 'package:flutter/material.dart';

class GantiPasswordPage extends StatefulWidget {
  const GantiPasswordPage({super.key});

  @override
  State<GantiPasswordPage> createState() => _GantiPasswordPageState();
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  bool isPasswordLama = true;
  bool isPasswordBaru = true;
  bool isKonfirmasi = true;

  final TextEditingController passwordLamaController = TextEditingController();

  final TextEditingController passwordBaruController = TextEditingController();

  final TextEditingController konfirmasiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ganti Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        backgroundColor: Color(0xFF42A5F5),

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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFD6ECFF), Color(0xFFB3D9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Container(
            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),

              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFFD6ECFF),

                    child: Icon(
                      Icons.lock_outline,
                      size: 50,
                      color: Color(0xFF42A5F5),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    "Ubah Password",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "Pastikan password baru mudah diingat namun tetap aman.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),

                const SizedBox(height: 30),

                // PASSWORD LAMA
                TextField(
                  controller: passwordLamaController,
                  obscureText: isPasswordLama,

                  decoration: InputDecoration(
                    labelText: 'Password Lama',

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.blue,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordLama
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          isPasswordLama = !isPasswordLama;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: const Color(0xFFF8FBFF),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),

                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 1.5,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),

                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),

                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // PASSWORD BARU
                TextField(
                  controller: passwordBaruController,
                  obscureText: isPasswordBaru,

                  decoration: InputDecoration(
                    labelText: 'Password Baru',

                    prefixIcon: const Icon(
                      Icons.lock_reset,
                      color: Color(0xFF42A5F5),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordBaru
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          isPasswordBaru = !isPasswordBaru;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: const Color(0xFFF8FBFF),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // KONFIRMASI PASSWORD
                TextField(
                  controller: konfirmasiController,
                  obscureText: isKonfirmasi,

                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',

                    prefixIcon: const Icon(
                      Icons.verified_user_outlined,
                      color: Colors.blue,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        isKonfirmasi ? Icons.visibility_off : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          isKonfirmasi = !isKonfirmasi;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: const Color(0xFFF8FBFF),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {
                      if (passwordBaruController.text !=
                          konfirmasiController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Konfirmasi password tidak cocok'),
                          ),
                        );

                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password berhasil diubah'),
                        ),
                      );

                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: const Text(
                      'Simpan Password',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
