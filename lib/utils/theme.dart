import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.indigoAccent.shade700,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.indigoAccent.shade700,
    secondary: Colors.indigo.shade300,
    onSecondary: Colors.indigo.shade300,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.indigoAccent.shade700,
    onBackground: Colors.white,
    surface: Colors.white,
    onSurface: Colors.indigoAccent.shade700,
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
);
