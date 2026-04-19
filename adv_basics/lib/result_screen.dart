import 'package:adv_basics/data/questios.dart';
import 'package:adv_basics/components/qustions_summary.dart';
// import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.chosenAnswers,
    required this.restartQuiz,
    super.key,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotolQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    // Widget screenWidget;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // child's
            Text(
              'You answerd $numCorrectQuestions out of $numTotolQuestions questions correctly!',
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255) ,fontSize: 16),
            ),
            const SizedBox(height: 30),

            QustionsSummary(getSummaryData()),

            const SizedBox(height: 30),

            TextButton.icon(
              icon: const Icon(Icons.restart_alt, color: Colors.white),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
