import 'package:flutter/material.dart';

//Singleton Pattern to manage input data
class BreathingData {
  static final BreathingData _singleton = BreathingData._internal();

  factory BreathingData() => _singleton;

  BreathingData._internal();

  final TextEditingController breathController =
      TextEditingController(text: '40');
  final TextEditingController inhaleController =
      TextEditingController(text: '2');
  final TextEditingController exhaleController =
      TextEditingController(text: '2');
  final TextEditingController inhaleHoldController =
      TextEditingController(text: '0');
  final TextEditingController exhaleHoldController =
      TextEditingController(text: '0');
}
