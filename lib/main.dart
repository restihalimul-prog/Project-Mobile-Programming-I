import 'package:flutter/material.dart';
import 'package:project_mp1/jkt.scapade/beranda/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Jkt.Scapade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 214, 232, 255),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
