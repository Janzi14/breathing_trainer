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
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(48, 93, 255, 1),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Color.fromRGBO(72, 107, 228, 1),
          secondary: Color.fromRGBO(91, 140, 204, 0.536),
          onSecondary: Color.fromRGBO(91, 140, 204, 0.536),
          error: Colors.red,
          onError: Colors.white,
          background: Color.fromRGBO(48, 93, 255, 1),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Color.fromRGBO(48, 93, 255, 1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            fixedSize: const Size(250, 70),
            textStyle: const TextStyle(fontSize: 28.0),
          ),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontSize: 76.0, fontWeight: FontWeight.w100, color: Colors.white),
          labelSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white70,
          ),
        ),
      ),
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
