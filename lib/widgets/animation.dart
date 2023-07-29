import 'package:breathing_app/utils/animation_controller_extension.dart';
import 'package:flutter/material.dart';

class BreathingAnimation {
  static late AnimationController textController;
  static TextStyle smallTextStyle =
      const TextStyle(fontSize: 60.0); // Starting text style
  static late Animation<TextStyle> bigTextStyle; // Animated text style

  // Method to run the breathing animation
  static void runAnimation(int times, BuildContext context) {
    bigTextStyle = textController.drive(
      TextStyleTween(
        begin: smallTextStyle, // Starting text style
        end: const TextStyle(fontSize: 100.0), // Ending text style
      ),
    );
    textController.reset(); // Reset the animation
    textController.forward(); // Start the animation
    textController.repeatEx(
        times: times,
        context: context); // Repeat the animation based on the specified times
  }
}
