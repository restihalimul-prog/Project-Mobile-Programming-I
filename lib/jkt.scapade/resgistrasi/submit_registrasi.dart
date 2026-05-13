import 'dart:ui';

import 'package:flutter/material.dart';


import 'package:project_mp1/jkt.scapade/beranda/beranda.dart';

//import 'package:project_mobile_programming/hover.dart';

class SubmitRegistrasi extends StatelessWidget {
  const SubmitRegistrasi({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 2 * 24,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Beranda()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF42A5F5), // hijau lebih soft
          foregroundColor: Colors.white, // teks putih
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
        'Daftar',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
