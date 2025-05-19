import 'package:flutter/material.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Navigation',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
