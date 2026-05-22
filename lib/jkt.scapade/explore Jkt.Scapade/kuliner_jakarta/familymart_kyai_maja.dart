import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FamilymartKyaiMaja extends StatelessWidget {
  const FamilymartKyaiMaja({super.key});

  void _openMaps() async {
    final Uri googleMapsUrl = Uri.parse(
      'https://maps.app.goo.gl/gv4uaWch9bLUBy4k9', // Lokasi contoh Gudeg Yu Djum
    );
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('familymart kyai maja', 
        style: TextStyle(color: Colors.white),),
        leading: const BackButton(),
        backgroundColor: Colors.brown[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image/familymart kyai maja.jpg',
                fit: BoxFit.cover,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star_half, color: Colors.amber, size: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '4.7/5 dari 200+ ulasan',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Buka: 06.00 - 00.00 WIB',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Jl. Kyai Maja No. 43, Gunung, Kebayoran Baru, Jakarta Selatan.',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.map),
                      label: const Text('Lihat di Google Maps'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _openMaps,
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              'Gerai ini dirancang dengan nuansa Jepang yang kental, memberikan pengalaman seperti berada di FamilyMart di Jepang.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );         
  }
}
