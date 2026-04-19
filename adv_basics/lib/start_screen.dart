import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuize, {super.key});
  
  final void Function() startQuize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 130),

          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(123, 255, 255, 255),
          ),

          SizedBox(height: 70),

          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),

          SizedBox(height: 70),

          OutlinedButton.icon(
            onPressed: startQuize,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quize'),
          ),
        ],
      ),
    );
  }
}
