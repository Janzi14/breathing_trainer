import 'package:breathing_app/routes/breathing.dart';
import 'package:breathing_app/routes/home.dart';
import 'package:breathing_app/routes/stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let us breathe',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeRoute(),
        '/breathing': (context) => const BreathingRoute(),
        '/stats': (context) => const StatsRoute(),
      },
    );
  }
}
