import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section4/data/questions.dart';
import 'package:section4/questions_screen.dart';
import 'package:section4/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    required this.switchScreen,
    required this.chosenAnswers,
    super.key,
  });

  void Function(String screenName) switchScreen;

  final List<String> chosenAnswers;

  List<Map<String, Object>> get getSummaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData;
    final numTotalQuestions = questions.length;
    //where will return new list
    /*final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;*/

    final numCorrectQuestions = summaryData.where((data) => data['user_answer'] == data['correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 32, 191),
                fontSize: 20
              ),
            ),
            const SizedBox(height: 30),
            // const Text('List of answers and questions...'),
            // const SizedBox(height: 30),

            QuestionsSummary(summaryData),

            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                switchScreen('start-screen');
              },
              icon: const Icon(Icons.refresh, weight: 5,),
              label: const Text(
                'Restart Quiz!',
              ),
            )
          ],
        ),
      ),
    );
  }
}
