import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

class StyleButton extends StatelessWidget {
  const StyleButton(this.onPressd, {super.key});

  @override
  final void Function() onPressd;
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressd,
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 255, 14, 2),
        textStyle: const TextStyle(fontSize: 28),
      ),

      child: const StyledText('Roll Dice'),
    );
  }
}
