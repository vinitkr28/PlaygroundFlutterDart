import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});


  void Function() startQuiz;

  void startQuizButtonPressed() {
    startQuiz();
    print("startQuiz is pressed!");
  }

  final opacity = Opacity(
    opacity: .5,
    child: Image.asset(
      'assets/images/quiz-logo.png',
      width: 300,
    ),
  );

  final assetImage = Image.asset(
    'assets/images/quiz-logo.png',
    width: 300,
    color: Colors.blueGrey,
  );

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          assetImage,
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 21),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuizButtonPressed,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.teal,
                textStyle: const TextStyle(fontSize: 16)),
            icon: const Icon(Icons.connecting_airports_sharp),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
