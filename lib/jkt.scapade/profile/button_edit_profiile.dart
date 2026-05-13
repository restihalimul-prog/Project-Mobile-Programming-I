import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/profile/edit_profile.dart';

class TombolEdit extends StatelessWidget {
  const TombolEdit({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width - 2 * 24,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilPage()),
          );
        },
        icon: const Icon(Icons.edit),
        label: const Text(
          'Edit Profil',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
