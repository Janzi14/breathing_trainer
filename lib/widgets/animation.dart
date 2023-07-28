import 'package:breathing_app/data/input_controller.dart';
import 'package:flutter/material.dart';

extension on AnimationController {
  void repeatEx({required int times}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (int.parse(inhaleHoldController.text) > 0) {
          BreathingAnimation.isHold = true;
        }
        Future.delayed(Duration(seconds: int.parse(inhaleHoldController.text)),
            () {
          BreathingAnimation.isInhale = false;
          BreathingAnimation.isHold = false;
          reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        if (int.parse(exhaleHoldController.text) > 0) {
          BreathingAnimation.isHold = true;
        }
        Future.delayed(
          Duration(seconds: int.parse(exhaleHoldController.text)),
          () {
            if (++count < times) {
              BreathingAnimation.breathCount = count + 1;
              BreathingAnimation.isInhale = true;
              BreathingAnimation.isHold = false;
              forward();
            }
          },
        );
      }
    });
  }
}

class BreathingAnimation {
  static bool isInhale = true;
  static bool isHold = false;
  static int breathCount = 1;

  static late AnimationController textController;
  static TextStyle smallTextStyle = const TextStyle(fontSize: 60.0);
  static late Animation<TextStyle> bigTextStyle;

  static void runAnimation(int times) {
    bigTextStyle = textController.drive(
      TextStyleTween(
        begin: smallTextStyle,
        end: const TextStyle(fontSize: 120.0),
      ),
    );

    textController.reset();
    textController.forward();
    textController.repeatEx(times: times);
  }
}
