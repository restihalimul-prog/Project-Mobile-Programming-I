import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsJakartaPage extends StatefulWidget {
  const MapsJakartaPage({super.key});

  @override
  State<MapsJakartaPage> createState() => _MapsJakartaPageState();
}

class _MapsJakartaPageState extends State<MapsJakartaPage> {

  final List<Map<String, dynamic>> wisataList = [

    {
      "nama": "Monas",
      "lokasi": LatLng(-6.175392, 106.827153),
      "deskripsi": "Monumen Nasional Jakarta"
    },

    {
      "nama": "Kota Tua",
      "lokasi": LatLng(-6.135200, 106.813301),
      "deskripsi": "Wisata sejarah Jakarta"
    },

    {
      "nama": "Ancol",
      "lokasi": LatLng(-6.125600, 106.833000),
      "deskripsi": "Pantai & taman hiburan"
    },

    {
      "nama": "TMII",
      "lokasi": LatLng(-6.302445, 106.895155),
      "deskripsi": "Taman Mini Indonesia Indah"
    },
  ];

  Future<void> bukaGoogleMaps(double lat, double lng) async {

    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEAF5FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Explore Jakarta Maps",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: FlutterMap(

            options: MapOptions(
              initialCenter: LatLng(-6.200000, 106.816666),
              initialZoom: 11,

              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),

            children: [

              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                userAgentPackageName: 'com.example.project_mp1',
              ),

              MarkerLayer(

                markers: wisataList.map((wisata) {

                  return Marker(

                    point: wisata["lokasi"],
                    width: 80,
                    height: 80,

                    child: GestureDetector(

                      onTap: () {

                        showModalBottomSheet(
                          context: context,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),

                          builder: (_) {

                            return Padding(
                              padding: const EdgeInsets.all(20),

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    wisata["nama"],

                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    wisata["deskripsi"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  SizedBox(
                                    width: double.infinity,

                                    child: ElevatedButton.icon(

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF42A5F5),

                                        padding:
                                            const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),

                                      onPressed: () {

                                        final LatLng lokasi =
                                            wisata["lokasi"];

                                        bukaGoogleMaps(
                                          lokasi.latitude,
                                          lokasi.longitude,
                                        );
                                      },

                                      icon: const Icon(
                                        Icons.map,
                                        color: Colors.white,
                                      ),

                                      label: const Text(
                                        "Buka di Google Maps",

                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}