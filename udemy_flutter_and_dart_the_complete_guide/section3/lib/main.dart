import 'package:flutter/material.dart';
import 'package:section1/quiz.dart';
import 'package:section1/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
