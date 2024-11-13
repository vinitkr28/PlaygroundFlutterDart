import 'package:flutter/material.dart';

const startAlignmet = Alignment.topLeft;
const endtAlignmet = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  void rollDice() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignmet,
          end: endtAlignmet,
        ),
      ),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            'assets/images/dice-2.png',
            width: 200,
          ),
          // ElevatedButton(onPressed: rollDice, child: Text("data")),
          // OutlinedButton(onPressed: (){}, child: Text("wwww")),

          SizedBox(height: 20,),
          TextButton(
            onPressed: () {},
            child: const Text("Roll Device"),
            style: TextButton.styleFrom(
              // padding: EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28)),
          )
        ]),
      ),
    );
  }
}
