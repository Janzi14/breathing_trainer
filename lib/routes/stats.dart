import 'package:flutter/material.dart';

class StatsRoute extends StatelessWidget {
  const StatsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Stats!',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
