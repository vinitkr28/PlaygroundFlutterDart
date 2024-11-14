
import 'package:flutter/material.dart';
import 'package:section1/answer_button.dart';
import 'package:section1/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];


    var textDecoration = TextDecoration.lineThrough;

    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextButton(onPressed: () {}, child: Text('data'), style: TextButton.styleFrom(disabledBackgroundColor: Colors.indigo),),
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              backgroundColor: Colors.amberAccent,
              // decoration: TextDecoration.underline,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
              decorationThickness: 1.5
            ),
            textAlign: TextAlign.center,

          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText: currentQuestion.answer[0],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answer[1],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answer[2],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answer[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
