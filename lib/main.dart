import 'package:flutter/material.dart';
import 'package:project_valentines_day/screens/splash_screen.dart';
import 'package:project_valentines_day/themes/base_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NGO App',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
