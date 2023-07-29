import 'package:breathing_app/data/breathing_data.dart';
import 'package:breathing_app/widgets/animation.dart';
import 'package:flutter/material.dart';

class BreathingRoute extends StatefulWidget {
  const BreathingRoute({super.key});

  @override
  State<BreathingRoute> createState() => _BreathingRouteState();
}

class _BreathingRouteState extends State<BreathingRoute>
    with SingleTickerProviderStateMixin {
  BreathingData breathingData = BreathingData();

  @override
  void initState() {
    super.initState();
    BreathingAnimation.textController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: int.parse(breathingData.inhaleController.text),
      ),
      reverseDuration: Duration(
        seconds: int.parse(breathingData.exhaleController.text),
      ),
    );
    BreathingAnimation.textController.addListener(
      () {
        setState(() {
          BreathingAnimation.smallTextStyle =
              BreathingAnimation.bigTextStyle.value;
        });
      },
    );
    BreathingAnimation.isMounted = true;
    BreathingAnimation.runAnimation(
        int.parse(breathingData.breathController.text));
  }

  @override
  void dispose() {
    BreathingAnimation.isInhale = true;
    BreathingAnimation.isHold = false;
    BreathingAnimation.isMounted = false;
    BreathingAnimation.smallTextStyle = const TextStyle(fontSize: 60.0);
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
                'Breath #${BreathingAnimation.breathCount}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(
              BreathingAnimation.isHold
                  ? 'HOLD'
                  : BreathingAnimation.isInhale
                      ? 'IN'
                      : 'OUT',
              style: BreathingAnimation.smallTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, '/'),
                child: const Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
