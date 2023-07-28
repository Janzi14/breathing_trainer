import 'package:breathing_app/data/input_controller.dart';
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
                  controller: breathController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberInputField(
                  labelText: 'Seconds per inhale',
                  controller: inhaleController,
                ),
                NumberInputField(
                  labelText: 'Seconds per exhale',
                  controller: exhaleController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberInputField(
                  labelText: 'Hold after inhale',
                  controller: inhaleHoldController,
                ),
                NumberInputField(
                  labelText: 'Hold after exhale',
                  controller: exhaleHoldController,
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
