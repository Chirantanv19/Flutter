import 'package:flutter/material.dart';
import 'package:first_app/button_style.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  var currentDiceRoll = 2;

  void rollDice() {
    // ...d
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
    print('this function is called!');
  }

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Image.asset('assets/dice-$currentDiceRoll.png', width: 200),

        SizedBox(height: 20),

        StyleButton(rollDice),
      ],
    );
  }
}
