import 'package:countdown_pill/countdown_pill.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Countdown Pill Example')),
        body: Center(
          child: CountdownPill(
            targetDate: DateTime(2025, 3, 25),
            format: '{d} days {H} hours {M} minutes {S} seconds',
          ),
        ),
      ),
    );
  }
}
