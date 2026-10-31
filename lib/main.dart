import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/mahasiswa/presentation/screens/home_test_screen.dart';

void main() {
  runApp(const KostPointApp());
}

class KostPointApp extends StatelessWidget {
  const KostPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kost Point',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeTestScreen(),
    );
  }
}
