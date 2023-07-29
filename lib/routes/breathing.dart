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
    breathingData.isMounted = true;
    BreathingAnimation.runAnimation(
        int.parse(breathingData.breathController.text), context);
  }

  @override
  void dispose() {
    breathingData.isInhale = true;
    breathingData.isHold = false;
    breathingData.isMounted = false;
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
                'Breath #${breathingData.breathCount}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: Text(
                  breathingData.isHold
                      ? 'HOLD'
                      : breathingData.isInhale
                          ? 'IN'
                          : 'OUT',
                  style: BreathingAnimation.smallTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')),
                child: const Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
