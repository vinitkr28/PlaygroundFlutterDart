import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section5/answer_button.dart';
import 'package:section5/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState2();
}

class _QuestionsScreenState1 extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    var currentQuestion = questions[0];

    var textDecoration = TextDecoration.lineThrough;

    var currentQuestionIndex = 0;

    void answerQuestion() {
      // currentQuestionIndex += 1;
      setState(() {
        currentQuestionIndex++;
        // currentQuestion = questions[currentQuestionIndex];
      });
    }

    var answerButtons =
        currentQuestion.getShuffledAnswer.asMap().entries.map((entry) {
      return AnswerButton(
          answerText: '${entry.key + 1}. ${entry.value}',
          onTap: answerQuestion);
    });

    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextButton(onPressed: () {}, child: Text('data'), style: TextButton.styleFrom(disabledBackgroundColor: Colors.indigo),),
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  backgroundColor: Colors.amberAccent,
                  // decoration: TextDecoration.underline,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                  decorationThickness: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /*
            ...currentQuestion.answer.map((answer) {
              return AnswerButton(
                answerText: 'answer$answer',
                onTap: () {},
              );
            }),
            */

            ...answerButtons
          ],
        ),
      ),
    );
  }
}

class _QuestionsScreenState2 extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  dynamic currentQuestion;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    // if (currentQuestionIndex == 5) currentQuestionIndex = 0;
    setState(() {
      currentQuestionIndex++;
    });
    // print('currentQuestionIndex: $currentQuestionIndex. ${currentQuestion.text}');
  }

  TextStyle questionTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      backgroundColor: Colors.amberAccent,
      // decoration: TextDecoration.underline,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.double,
      decorationThickness: 1.5);

  TextStyle questionTextStyleWithGoogleFontsLato = GoogleFonts.lato(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  @override
  Widget build(context) {
    currentQuestion = questions[currentQuestionIndex];

    var answerButtons =
        currentQuestion.getShuffledAnswer.asMap().entries.map((entry) {
      final ans = entry.value;
      return AnswerButton(
          answerText: '${entry.key + 1}. $ans',
          onTap: () {
            answerQuestion(ans);
          });
    });

    var textDecoration = TextDecoration.lineThrough;

    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextButton(onPressed: () {}, child: Text('data'), style: TextButton.styleFrom(disabledBackgroundColor: Colors.indigo),),
            Text(
              '${currentQuestionIndex + 1}. ${currentQuestion.text}',
              style: questionTextStyleWithGoogleFontsLato,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /*
            ...currentQuestion.answer.map((answer) {
              return AnswerButton(
                answerText: 'answer$answer',
                onTap: () {},
              );
            }),
            */

            ...answerButtons
          ],
        ),
      ),
    );
  }
}

class SomeClass {
  void someFunction() {
    var currentQuestion = questions[0];
    var ss = currentQuestion.answer.asMap().entries.map((entry) {
      return Text(entry.value);
    });
  }
}

/*

[
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
]

*/
