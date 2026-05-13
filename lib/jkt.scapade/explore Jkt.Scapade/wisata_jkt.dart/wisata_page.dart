import 'package:flutter/material.dart';

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/destinasi_wisata.jpg', fit: BoxFit.cover, height: 250, width: double.infinity),
        const SizedBox(height: 20),
        const Text(
          "Destinasi Wisata",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text("Temukan wisata alam, sejarah, dan pusat belanja di Jogja."),
      ],
    );
  }
}

