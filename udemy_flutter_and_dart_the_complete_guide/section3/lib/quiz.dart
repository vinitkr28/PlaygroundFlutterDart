import 'package:flutter/material.dart';
import 'package:section1/questions_screen.dart';
import 'package:section1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState3();
}

// handle activeScreen through initState example
class _QuizState1 extends State<Quiz> {
  // Widget activeScreen = StartScreen(switchScreen);

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // activeScreen = 'questions-screen';
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}


// handle activeScreen without initState example
class _QuizState2 extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}

// handle activeScreen without initState and create screenWidget with condition, example
class _QuizState3 extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child:screenWidget,
        ),
      ),
    );
  }
}

// handle activeScreen without initState and create screenWidget with if else condition, example
class _QuizState4 extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen.endsWith('questions-screen')) {
      screenWidget = const QuestionsScreen();
    } else if(activeScreen.endsWith('start-screen')) {
      screenWidget = StartScreen(switchScreen);
    }


    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child:screenWidget,
        ),
      ),
    );
  }
}
