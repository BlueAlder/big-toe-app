import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../models/game.model.dart';
import '../services/game.service.dart';
import '../shared/styles.dart' as styles;

GameService gameService = GetIt.I.get<GameService>();

class GameLengthSetting extends StatefulWidget {
  const GameLengthSetting({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  State<GameLengthSetting> createState() => _GameLengthSettingState();
}

class _GameLengthSettingState extends State<GameLengthSetting>
    with SingleTickerProviderStateMixin {
  static const positiveIncrementAmount = 10;
  static const negativeIncrementAmount = -10;

  handleChangeTotalRounds(int roundChange) {
    setState(() {
      widget.game.changeTotalRounds(roundChange);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rounds", style: styles.getRegularTextStyle()),
        RepaintBoundary(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () =>
                    handleChangeTotalRounds(negativeIncrementAmount),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                // switchOutCurve: Curves.easeInOutCubic,
                // switchInCurve: Curves.fastLinearToSlowEaseIn,
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
                // transitionBuilder: (child, animation) =>
                //     ScaleTransition(scale: animation, child: widget),
                // transitionBuilder: (Widget child, Animation<double> animation) =>
                //     RotationTransition(
                //   turns: animation,
                //   child: widget,
                // ),
                child: Text(widget.game.totalRounds.toString(),
                    key: ValueKey(widget.game.totalRounds),
                    style: styles.getRegularTextStyle()),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () =>
                    handleChangeTotalRounds(positiveIncrementAmount),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// class GameLengthSetting extends StatelessWidget {
//   GameLengthSetting(
//       {Key? key, required this.initialNumRounds, required this.incrementFn})
//       : super(key: key);
//   int numRounds;
//   final Function incrementFn;
//
//
//
// }
