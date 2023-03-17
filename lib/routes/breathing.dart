import 'package:breathing_app/data/input_controller.dart';
import 'package:breathing_app/widgets/animation.dart';
import 'package:flutter/material.dart';

class BreathingRoute extends StatefulWidget {
  const BreathingRoute({super.key});

  @override
  State<BreathingRoute> createState() => _BreathingRouteState();
}

class _BreathingRouteState extends State<BreathingRoute>
    with SingleTickerProviderStateMixin {
  int round = 1;
  int breath = 1;

  @override
  void initState() {
    super.initState();
    BreathingAnimation.textController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: int.parse(inhaleController.text),
      ),
      reverseDuration: Duration(
        seconds: int.parse(exhaleController.text),
      ),
    );
    BreathingAnimation.textController.addListener(
      () {
        setState(() {
          BreathingAnimation.smallTextSTyle =
              BreathingAnimation.bigTextStyle.value;
        });
      },
    );
    BreathingAnimation.runAnimation(int.parse(breathController.text));
  }

  @override
  void dispose() {
    BreathingAnimation.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Text(
                'Round $round',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(
              BreathingAnimation.isHold
                  ? 'HOLD'
                  : BreathingAnimation.isInhale
                      ? 'IN'
                      : 'OUT',
              style: BreathingAnimation.smallTextSTyle,
            ),
            ElevatedButton(
              onPressed: () => Navigator.popAndPushNamed(context, '/'),
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
