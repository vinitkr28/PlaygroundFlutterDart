import 'package:flutter/material.dart';
import 'package:section5/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();

    // return const MaterialApp(home: TextWidgetsSample1());

    // return const MaterialApp(home: TextWidgetsSample2());

  }
}
