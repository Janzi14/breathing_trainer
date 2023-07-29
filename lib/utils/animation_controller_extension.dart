import 'package:breathing_app/data/breathing_data.dart';
import 'package:flutter/material.dart';

// Extension method on AnimationController for custom repeating animation logic
extension RepeatAnimationController on AnimationController {
  void repeatEx({required int times}) {
    BreathingData breathingData = BreathingData();
    var count = 0; // Counter to keep track of animation repetitions
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Logic for when the animation completes (inhale phase)
        if (int.parse(breathingData.inhaleHoldController.text) > 0) {
          breathingData.isHold = true; // Set inhale hold state if specified
        }
        // Delayed logic after inhale phase (set inhale to false, hold to false, and reverse the animation)
        Future.delayed(
            Duration(
                seconds: int.parse(breathingData.inhaleHoldController.text)),
            () {
          if (breathingData.isMounted) {
            breathingData.isInhale = false;
            breathingData.isHold = false;
            reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed) {
        // Logic for when the animation is dismissed (exhale phase)
        if (int.parse(breathingData.exhaleHoldController.text) > 0) {
          breathingData.isHold = true; // Set exhale hold state if specified
        }
        // Delayed logic after exhale phase (increment count, set inhale to true, hold to false, and forward the animation)
        Future.delayed(
            Duration(
                seconds: int.parse(breathingData.exhaleHoldController.text)),
            () {
          if (++count < times && breathingData.isMounted) {
            breathingData.breathCount = count + 1;
            breathingData.isInhale = true;
            breathingData.isHold = false;
            forward();
          }
        });
      }
    });
  }
}
