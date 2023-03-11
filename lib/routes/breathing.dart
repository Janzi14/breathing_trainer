import 'package:flutter/material.dart';

class BreathingRoute extends StatelessWidget {
  const BreathingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Round #'),
            const Text('IN OUT'),
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
