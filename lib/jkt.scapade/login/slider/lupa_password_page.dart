import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/beranda.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lupa Password",

          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF42A5F5),
      ),

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFD6ECFF), Color(0xFFB3D9FF)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Container(
              width: 450,

              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),

              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    // ICON
                    Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.lock_reset,
                        size: 70,
                        color: Color(0xFF42A5F5),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // TITLE
                    const Text(
                      "Reset Password",

                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFF42A5F5),
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 12),

                    // SUBTITLE
                    const Text(
                      "Masukkan email yang terdaftar untuk menerima link reset password.",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        height: 1.6,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 30),

                    // EMAIL FIELD
                    TextFormField(
                      controller: emailController,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,

                        labelText: "Email",

                        prefixIcon: const Icon(Icons.email_outlined),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // SNACKBAR
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Mengalihkan ke Beranda..."),

                                backgroundColor: Colors.grey,
                              ),
                            );

                            // PINDAH HALAMAN
                            Future.delayed(
                              const Duration(milliseconds: 1500),

                              () {
                                Navigator.pushAndRemoveUntil(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) => const Beranda(),
                                  ),

                                  (route) => false,
                                );
                              },
                            );
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E88E5),
                          foregroundColor: Colors.white,
                          elevation: 5,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        child: const Text(
                          "Kirim",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
