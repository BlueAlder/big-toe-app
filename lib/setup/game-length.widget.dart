import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/game.service.dart';
import '../shared/styles.dart' as styles;

GameService gameService = GetIt.I.get<GameService>();

class GameLengthSetting extends StatelessWidget {
  const GameLengthSetting(
      {Key? key, required this.numRounds, required this.incrementFn})
      : super(key: key);
  final int numRounds;
  final Function incrementFn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rounds", style: styles.getRegularTextStyle()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.white,),
              onPressed: () => incrementFn(-10),
            ),
            Text(numRounds.toString(), style: styles.getRegularTextStyle()),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () => incrementFn(10),
            ),
          ],
        )
      ],
    );
  }
}
