import 'package:flutter/material.dart';
import 'package:portfolio/screens/herosections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rajat Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFF2196F3),
      ),
      home: const HeroSection(), // ✅ Set HeroSection as default screen
    );
  }
}
