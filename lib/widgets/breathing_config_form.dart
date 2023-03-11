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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                NumberInputField(labelText: 'Breaths per round *'),
                NumberInputField(labelText: 'Number of rounds *'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                NumberInputField(labelText: 'Seconds per inhale *'),
                NumberInputField(labelText: 'Seconds per exhale *'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: const Text('dddd')),
          ],
        ),
      ),
    );
  }
}
