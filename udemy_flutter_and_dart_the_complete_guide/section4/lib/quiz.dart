import 'package:flutter/material.dart';
import 'package:section4/data/questions.dart';
import 'package:section4/questions_screen.dart';
import 'package:section4/result_screen.dart';
import 'package:section4/sample_widgets/text_widgets.dart';
import 'package:section4/start_screen.dart';

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

  void switchScreen(String screenName) {
    setState(() {
      // activeScreen = 'questions-screen';
      activeScreen = QuestionsScreen(
        (answer) {},
      );
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

  void switchScreen(String screenName) {
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
              : QuestionsScreen(
                  (answer) {},
                ),
        ),
      ),
    );
  }
}

// handle activeScreen without initState and create screenWidget with condition, example
class _QuizState3 extends State<Quiz> {
  final List<String> _selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen(String screenName) {
    print("Quiz:: switch screen to $screenName");
    setState(() {
      if (screenName.endsWith('start-screen')) {
        activeScreen = 'start-screen';
      }
      if (screenName.endsWith('questions-screen')) {
        activeScreen = 'questions-screen';
      }
      if (screenName.endsWith('result-screen')) {
        activeScreen = 'result-screen';
      }
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    print('Quiz:: $answer, '
        'selectedAnswer.length: ${_selectedAnswer.length}, '
        'questions.length: ${questions.length}');

    if (_selectedAnswer.length == questions.length) {
      // selectedAnswer.clear();
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  Widget currentWidget(String activeScreen) {
    Widget w;
    switch (activeScreen) {
      case 'start-screen':
        _selectedAnswer.clear();
        w = StartScreen(switchScreen);
        break;
      case 'questions-screen':
        w = QuestionsScreen(chooseAnswer);
        break;
      case 'result-screen':
        w = ResultScreen(
          switchScreen: switchScreen,
          chosenAnswers: _selectedAnswer,
        );
        break;
      default:
        w = const TextWidgetsSample1();
    }
    return w;
  }

  @override
  Widget build(context) {
    /*final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(chooseAnswer);*/

    var screenWidget = currentWidget(activeScreen);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

// handle activeScreen without initState and create screenWidget with if else condition, example
class _QuizState4 extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen(String screenName) {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen.endsWith('questions-screen')) {
      screenWidget = QuestionsScreen(
        (answer) {},
      );
    } else if (activeScreen.endsWith('start-screen')) {
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
          child: screenWidget,
        ),
      ),
    );
  }
}
