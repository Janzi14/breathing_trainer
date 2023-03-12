import 'package:flutter/material.dart';

extension on AnimationController {
  void repeatEx({required int times}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        BreathingAnimation.isInhale = false;
        reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (++count < times) {
          BreathingAnimation.isInhale = true;
          forward();
        }
      }
    });
  }
}

class BreathingAnimation {
  static bool isInhale = true;
  static bool isHold = false;

  static late AnimationController textController;
  static TextStyle smallTextSTyle = const TextStyle(fontSize: 60.0);
  static late Animation<TextStyle> bigTextStyle;

  static void runAnimation(int times) {
    bigTextStyle = textController.drive(
      TextStyleTween(
        begin: smallTextSTyle,
        end: const TextStyle(fontSize: 120.0),
      ),
    );

    textController.reset();
    textController.forward();
    textController.repeatEx(times: times);
  }
}
