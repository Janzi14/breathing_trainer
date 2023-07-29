import 'package:breathing_app/data/breathing_data.dart';
import 'package:flutter/material.dart';

// Extension method on AnimationController for custom repeating animation logic
extension on AnimationController {
  void repeatEx({required int times}) {
    BreathingData breathingData = BreathingData();
    var count = 0; // Counter to keep track of animation repetitions
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Logic for when the animation completes (inhale phase)
        if (int.parse(breathingData.inhaleHoldController.text) > 0) {
          BreathingAnimation.isHold =
              true; // Set inhale hold state if specified
        }
        // Delayed logic after inhale phase (set inhale to false, hold to false, and reverse the animation)
        Future.delayed(
            Duration(
                seconds: int.parse(breathingData.inhaleHoldController.text)),
            () {
          if (BreathingAnimation.isMounted) {
            BreathingAnimation.isInhale = false;
            BreathingAnimation.isHold = false;
            reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed) {
        // Logic for when the animation is dismissed (exhale phase)
        if (int.parse(breathingData.exhaleHoldController.text) > 0) {
          BreathingAnimation.isHold =
              true; // Set exhale hold state if specified
        }
        // Delayed logic after exhale phase (increment count, set inhale to true, hold to false, and forward the animation)
        Future.delayed(
            Duration(
                seconds: int.parse(breathingData.exhaleHoldController.text)),
            () {
          if (++count < times && BreathingAnimation.isMounted) {
            BreathingAnimation.breathCount = count + 1;
            BreathingAnimation.isInhale = true;
            BreathingAnimation.isHold = false;
            forward();
          }
        });
      }
    });
  }
}

class BreathingAnimation {
  static bool isInhale = true;
  static bool isHold = false;
  static int breathCount = 1;
  static bool isMounted = false;

  static late AnimationController textController;
  static TextStyle smallTextStyle =
      const TextStyle(fontSize: 60.0); // Starting text style
  static late Animation<TextStyle> bigTextStyle; // Animated text style

  // Method to run the breathing animation
  static void runAnimation(int times) {
    bigTextStyle = textController.drive(
      TextStyleTween(
        begin: smallTextStyle, // Starting text style
        end: const TextStyle(fontSize: 120.0), // Ending text style
      ),
    );

    textController.reset(); // Reset the animation
    textController.forward(); // Start the animation
    textController.repeatEx(
        times: times); // Repeat the animation based on the specified times
  }
}
