import 'package:breathing_app/data/breathing_data.dart';
import 'package:flutter/material.dart';

class CompletedRoute extends StatelessWidget {
  const CompletedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    BreathingData breathingData = BreathingData();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                'Completed',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 50,
              children: [
                Text(
                  'Number of Breaths: ${breathingData.breathController.text}',
                ),
                Text(
                  'Seconds per inhale: ${breathingData.breathController.text}',
                ),
                Text(
                  'Seconds per exhale: ${breathingData.breathController.text}',
                ),
                Text(
                  'Hold after inhale: ${breathingData.breathController.text}',
                ),
                Text(
                  'Hold after exhale: ${breathingData.breathController.text}',
                ),
              ],
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
