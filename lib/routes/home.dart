import 'package:flutter/material.dart';
import 'package:breathing_app/widgets/breathing_config_form.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: SafeArea(
                child: Text(
                  'Breathify',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            const BreathingConfigForm(),
          ],
        ),
      ),
    );
  }
}
