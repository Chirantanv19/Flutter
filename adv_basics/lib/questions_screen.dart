import 'package:adv_basics/components/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questios.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectedAnswers, super.key});

  final void Function(String answer) onSelectedAnswers;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selecteAnswers) {
    widget.onSelectedAnswers(selecteAnswers);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQustion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Qustion
            Text(
              currentQustion.text,
              style: GoogleFonts.craftyGirls(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            //  Answer List
            ...currentQustion.getShuffledAnswers().map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  SizedBox(height: 10),
                  AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
