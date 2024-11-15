import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});


  void Function(String screenName) startQuiz;

  void startQuizButtonPressed() {
    startQuiz('questions-screen');
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


  TextStyle testStyle1 = const TextStyle(
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
    fontSize: 24,);

  TextStyle testStyleGoogleLato = GoogleFonts.lato(
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
    fontSize: 24,
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
          Text(
            "Learn Flutter the fun way!",
            style: testStyleGoogleLato,
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
