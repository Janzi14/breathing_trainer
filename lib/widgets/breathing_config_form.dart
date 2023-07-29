import 'package:breathing_app/data/breathing_data.dart';
import 'package:breathing_app/widgets/number_input_field.dart';
import 'package:flutter/material.dart';

class BreathingConfigForm extends StatefulWidget {
  const BreathingConfigForm({
    super.key,
  });

  @override
  State<BreathingConfigForm> createState() => _BreathingConfigFormState();
}

class _BreathingConfigFormState extends State<BreathingConfigForm> {
  final _formKey = GlobalKey<FormState>();
  BreathingData breathingData = BreathingData();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberInputField(
                  labelText: 'Number of Breaths',
                  controller: breathingData.breathController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberInputField(
                  labelText: 'Seconds per inhale',
                  controller: breathingData.inhaleController,
                ),
                NumberInputField(
                  labelText: 'Seconds per exhale',
                  controller: breathingData.exhaleController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberInputField(
                  labelText: 'Hold after inhale',
                  controller: breathingData.inhaleHoldController,
                ),
                NumberInputField(
                  labelText: 'Hold after exhale',
                  controller: breathingData.exhaleHoldController,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/breathing',
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please chek your inputs'),
                      ),
                    );
                  }
                },
                child: const Text('Start Session'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
