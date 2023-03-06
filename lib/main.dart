import 'package:chapter9/home_screen.dart';
import 'package:chapter9/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: SplashScreen(),
    );
  }
}