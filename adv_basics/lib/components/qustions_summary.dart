import 'package:adv_basics/data/questios.dart';
import 'package:flutter/material.dart';

class QustionsSummary extends StatelessWidget {
  const QustionsSummary(this.summaryDate, {super.key});

  final List<Map<String, Object>> summaryDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryDate.map((data) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text('${(data['question_index'] as int) + 1}'),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(height: 6),
                    Text('Your: ${data['user_answer']}'),
                    Text('Correct: ${data['correct_answer']}'),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
