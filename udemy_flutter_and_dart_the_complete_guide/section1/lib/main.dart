import 'package:flutter/material.dart';
import 'package:section1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 33, 5, 109),
          Color.fromARGB(255, 252, 12, 12),
        ),
      ),
    ),
  );
}
