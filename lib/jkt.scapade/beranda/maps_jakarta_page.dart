import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsJakartaPage extends StatefulWidget {
  const MapsJakartaPage({super.key});

  @override
  State<MapsJakartaPage> createState() => _MapsJakartaPageState();
}

class _MapsJakartaPageState extends State<MapsJakartaPage> {

  final LatLng _jakarta = const LatLng(-6.200000, 106.816666);

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Maps Jakarta",
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

          child: GoogleMap(
            onMapCreated: _onMapCreated,

            initialCameraPosition: CameraPosition(
              target: _jakarta,
              zoom: 11,
            ),

            markers: {
              Marker(
                markerId: const MarkerId("jakarta"),
                position: _jakarta,
                infoWindow: const InfoWindow(
                  title: "Jakarta",
                  snippet: "Ibu Kota Indonesia",
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}