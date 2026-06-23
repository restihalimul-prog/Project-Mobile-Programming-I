import 'package:flutter/material.dart';
import 'package:project_mp1/models/destination_model.dart';
import 'package:project_mp1/services/destination_service.dart';

class EditRekomendasiPage extends StatefulWidget {
  final DestinationModel destination;

  const EditRekomendasiPage({super.key, required this.destination});

  @override
  State<EditRekomendasiPage> createState() => _EditRekomendasiPageState();
}

class _EditRekomendasiPageState extends State<EditRekomendasiPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController alamatController;
  late TextEditingController jamController;
  late TextEditingController ratingController;
  late TextEditingController deskripsiController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(text: widget.destination.nama);

    alamatController = TextEditingController(text: widget.destination.alamat);

    jamController = TextEditingController(
      text: widget.destination.jamOperasional,
    );

    ratingController = TextEditingController(text: widget.destination.rating);

    deskripsiController = TextEditingController(
      text: widget.destination.deskripsi,
    );
  }

  Future<void> updateData() async {
    await DestinationService().updateDestination(widget.destination.id!, {
      'nama': namaController.text,
      'alamat': alamatController.text,
      'jamOperasional': jamController.text,
      'rating': ratingController.text,
      'deskripsi': deskripsiController.text,
    });

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data berhasil diupdate")));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Rekomendasi",
          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
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
          padding: const EdgeInsets.all(16),

          child: Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: "Nama Tempat",
                      prefixIcon: Icon(Icons.place),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: alamatController,
                    decoration: const InputDecoration(
                      labelText: "Alamat",
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: jamController,
                    decoration: const InputDecoration(
                      labelText: "Jam Operasional",
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: ratingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Rating",
                      prefixIcon: Icon(Icons.star),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: deskripsiController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: "Deskripsi",
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton.icon(
                      onPressed: updateData,

                      icon: const Icon(Icons.save),

                      label: const Text(
                        "Update Data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF42A5F5),

                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
    );
  }
}
