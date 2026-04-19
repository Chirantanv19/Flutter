import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({ required this.answerText, required this.onTap,super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 30, 8, 37),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 70,
        ),
      
      ),
      child:  Text(answerText));

  }
}
