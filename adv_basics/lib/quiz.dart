import 'package:adv_basics/data/questios.dart';
import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  // This File Directly go for exucute in all pages beacause this is base

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswers: chooseAnswer);
    }

    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffF1B9FF), Color(0xff030C3E)],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

  /*   void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
 */