/* import 'package:flutter/material.dart';

class QustionScreen extends StatefulWidget {
  const QustionScreen({super.key});

  @override
  State<QustionScreen> createState() {
    return _QustionScreen();
  }
}

class _QustionScreen extends State<QustionScreen> {
  bool isFinished = false;

  var score = 0;
  var currentQustion = 0;

  List<String> nums = [];
  List<String> correct = ["SDK", "Dart", "Column", "Google", "Widgets"];

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return ResultScreen(); // ✅ fixed call
    } else {
      return QuestionScreenUI(); // ✅ fixed call
    }
  }

  void nextQustion() {
    print(nums);

    if (currentQustion < 4) {
      setState(() {
        currentQustion = currentQustion + 1;
      });
    } else {
      setState(() {
        finalAns(); // ✅ moved here
        isFinished = true; // ✅ wrapped in setState
      });
    }
  }

  void finalAns() {
    score = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == correct[i]) {
        score++;
      }
    }

    print(score);
  }

  // ✅ removed context parameter
  Widget ResultScreen() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(questions[0].question, style: TextStyle(color: Colors.white)),
          Text(correct[0], style: TextStyle(color: Colors.white)),
          Text(
            nums.length > 0 ? nums[0] : "",
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 30),

          Text(questions[1].question, style: TextStyle(color: Colors.white)),
          Text(correct[1], style: TextStyle(color: Colors.white)),
          Text(
            nums.length > 1 ? nums[1] : "",
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 30),

          Text(questions[2].question, style: TextStyle(color: Colors.white)),
          Text(correct[2], style: TextStyle(color: Colors.white)),
          Text(
            nums.length > 2 ? nums[2] : "",
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 30),

          Text(questions[3].question, style: TextStyle(color: Colors.white)),
          Text(correct[3], style: TextStyle(color: Colors.white)),
          Text(
            nums.length > 3 ? nums[3] : "",
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 30),

          Text(questions[4].question, style: TextStyle(color: Colors.white)),
          Text(correct[4], style: TextStyle(color: Colors.white)),
          Text(
            nums.length > 4 ? nums[4] : "",
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 30),

          Text("$score", style: TextStyle(fontSize: 26, color: Colors.green)),
        ],
      ),
    );
  }

  // ✅ removed context parameter
  Widget QuestionScreenUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            questions[currentQustion].question,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),

          SizedBox(height: 50),

          ElevatedButton(
            onPressed: () {
              nums.add(questions[currentQustion].answers[0]);
              nextQustion();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 35, 7, 82),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 50),
            ),
            child: Text(questions[currentQustion].answers[0]),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              nums.add(questions[currentQustion].answers[1]);
              nextQustion();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 35, 7, 82),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 50),
            ),
            child: Text(questions[currentQustion].answers[1]),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              nums.add(questions[currentQustion].answers[2]);
              nextQustion();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 35, 7, 82),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 50),
            ),
            child: Text(questions[currentQustion].answers[2]),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              nums.add(questions[currentQustion].answers[3]);
              nextQustion();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 35, 7, 82),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 50),
            ),
            child: Text(questions[currentQustion].answers[3]),
          ),
        ],
      ),
    );
  }
}

// ================= MODEL =================
class QuizQuestion {
  final String question;
  final List<String> answers;

  QuizQuestion({required this.question, required this.answers});
}

// ================= DATA =================
var questions = [
  QuizQuestion(
    question: "What is Flutter?",
    answers: ["SDK", "Programming Language", "IDE", "Database"],
  ),
  QuizQuestion(
    question: "Which language is used by Flutter?",
    answers: ["Dart", "Java", "Python", "C++"],
  ),
  QuizQuestion(
    question: "What widget is used for layout in Flutter?",
    answers: ["Column", "Text", "Icon", "AppBar"],
  ),
  QuizQuestion(
    question: "Which company developed Flutter?",
    answers: ["Google", "Facebook", "Microsoft", "Amazon"],
  ),
  QuizQuestion(
    question: "What is used to build UI in Flutter?",
    answers: ["Widgets", "Classes", "Functions", "Packages"],
  ),
];
 */