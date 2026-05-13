import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Explore Jkt.Scapade',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
