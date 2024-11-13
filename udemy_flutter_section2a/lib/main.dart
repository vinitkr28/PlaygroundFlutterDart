import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

// import 'package:udemy_flutter_section2a/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questions = [
    'What\'s your favourite color?',
    'What\'s your favourite animal?',
  ];

  var questionIndex = 0;

  void _answerQuestion() {
    print("questionIndex Start-> \t$questionIndex");
    setState(() {
      if ((questionIndex + 1) >= questions.length)
        questionIndex = 0;
      else
        questionIndex++;

      print("questionIndex End-> \t$questionIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Question(questions[questionIndex]),
              Answer(_answerQuestion),
            ],
          ),
        ),
      ),
    );
  }
}
