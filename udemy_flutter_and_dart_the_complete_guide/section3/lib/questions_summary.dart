import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Widget userAnswerWidget(String actualAns, String userAns) {
    if (!actualAns.endsWith(userAns)) {
      return Text(
        userAns,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const Text('');
    }
  }

  bool isCorrectAnswer(String actualAns, String userAns) =>
      actualAns == userAns ? true : false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      // height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummeryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}

/*class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Widget userAnswerWidget(String actualAns, String userAns) {
    if (!actualAns.endsWith(userAns)) {
      return Text(
        userAns,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const Text('');
    }
  }

  bool isCorrectAnswer(String actualAns, String userAns) =>
      actualAns == userAns ? true : false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      // height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  // Text(((data['questions_index'] as int) + 1).toString()),
                  // Text('${(data['questions_index'] as int) + 1}.', style: const TextStyle(fontWeight: FontWeight.bold),),

                  QuestionIdentifier(
                      questionIndex: (data['questions_index'] as int) + 1,
                      isCorrectAnswer: isCorrectAnswer(
                          data['correct_answer'].toString(),
                          data['user_answer'].toString())),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['questions'].toString()),
                        const SizedBox(height: 5),
                        Text(
                          data['correct_answer'].toString(),
                          style: const TextStyle(color: Colors.green),
                        ),
                        userAnswerWidget(data['correct_answer'].toString(),
                            data['user_answer'].toString()),
                        const SizedBox(height: 50)
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}*/

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.questionIndex, required this.isCorrectAnswer, super.key});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    var indexWidget = Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionIndex.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );

    return indexWidget;
  }
}

class SummeryItem extends StatelessWidget {
  const SummeryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: (itemData['questions_index'] as int) + 1,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData['questions'].toString()),
                const SizedBox(height: 5),
                Text(
                  itemData['correct_answer'].toString(),
                  style: const TextStyle(color: Colors.green),
                ),
                if (!isCorrectAnswer)
                  Text(
                    itemData['user_answer'].toString(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                // const SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
