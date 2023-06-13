import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int num1 = 1;
  int num2 = 1;
  final randomizer = Random();

  void rollDice() {
    setState(() {
      num1 = randomizer.nextInt(6) + 1;
      num2 = randomizer.nextInt(6) + 1;
    });
  }

  String meyer() {
    if (num1 + num2 == 3) {
      return 'Meyer';
    } else if (num1 + num2 == 4) {
      return 'Lille meyer';
    } else if (num1 == num2) {
      return 'Par $num1';
    } else {
      if (num1 > num2) {
        return '$num1$num2';
      } else {
        return '$num2$num1';
      }
    }
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          meyer(),
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/dice-$num1.png',
              width: 200,
            ),
            Image.asset(
              'assets/images/dice-$num2.png',
              width: 200,
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
            shape: StadiumBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
