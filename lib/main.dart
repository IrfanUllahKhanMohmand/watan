import 'package:flutter/material.dart';

import 'presentation/pages/home_page.dart';

void main() {
  runApp(const WatanApp());
}

class WatanApp extends StatelessWidget {
  const WatanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F4E3D)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
