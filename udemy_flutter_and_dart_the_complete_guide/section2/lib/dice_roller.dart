import 'dart:math';

import 'package:flutter/material.dart';


final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';

  void rollDice() {

    var diceRoll = randomizer.nextInt(6) + 1;

    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });

    print('Changing image ...diceRoll: $diceRoll');
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        activeDiceImage,
        width: 200,
      ),
      // ElevatedButton(onPressed: rollDice, child: Text("data")),
      // OutlinedButton(onPressed: (){}, child: Text("wwww")),

      SizedBox(
        height: 20,
      ),
      TextButton(
        onPressed: rollDice,
        child: const Text("Roll Device"),
        style: TextButton.styleFrom(
            // padding: EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
      )
    ]);
  }
}
