import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/profile/edit_profile.dart';
import 'package:project_mp1/jkt.scapade/profile/user_data.dart'; // Pastikan import ini ada

class TombolEdit extends StatelessWidget {
  const TombolEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width - 2 * 24,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilPage(
                // Mengambil data langsung dari UserData
                nama: UserData.nama,
                email: UserData.email,
                nomorTelepon: UserData.noHp,
              ),
            ),
          );
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
