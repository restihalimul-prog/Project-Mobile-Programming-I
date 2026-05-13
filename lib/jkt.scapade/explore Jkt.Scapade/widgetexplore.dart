import 'package:flutter/material.dart';

class WidgetExplore extends StatelessWidget {
  final IconData icon;
  final String judul;

  const WidgetExplore({super.key, required this.icon, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(leading: Icon(icon), title: Text(judul)));
  }
}
