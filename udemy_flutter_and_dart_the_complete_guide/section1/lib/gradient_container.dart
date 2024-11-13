import 'package:flutter/material.dart';
import 'package:section1/dice_roller.dart';

const startAlignmet = Alignment.topLeft;
const endtAlignmet = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {

  //Need to remove const if, we created any variable like:
  //var activeDiceImage = 'assets/images/dice-2.png';
  //which is not const.

  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  /*GradientContainer(this.color1, this.color2, {super.key});

  GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;*/

  final Color color1;
  final Color color2;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, Colors.green],
          begin: startAlignmet,
          end: endtAlignmet,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
