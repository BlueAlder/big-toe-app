import 'package:flutter/material.dart';
import '../shared/styles.dart' as styles;


class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Game Over", style: styles.getPromptTextStyle()),
      ElevatedButton(
          onPressed: () => {Navigator.pop(context)},
          child: styles.getElevatedButtonChild("Play again?"),
          style: styles.getElevatedButtonStyle())
    ]);
  }
}