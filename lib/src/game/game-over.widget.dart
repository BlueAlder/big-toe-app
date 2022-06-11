import 'package:flutter/material.dart';
import '../shared/styles.dart';


class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Game Over", style: Styles.getPromptTextStyle()),
      ElevatedButton(
          onPressed: () => {Navigator.pop(context)},
          child: Styles.getElevatedButtonChild("Play again?"),
          style: Styles.getElevatedButtonStyle())
    ]);
  }
}