import 'dart:math';

import 'package:flutter/material.dart';
import '../models/game.model.dart';
import '../shared/styles.dart';
import 'game-over.widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // final prompts = utils.getFakePrompts(5);
  // int promptIndex = 0;
  final bgColors = {
    Colors.blue,
    Colors.lightGreen,
    Colors.deepPurpleAccent,
    Colors.redAccent
  };
  Color currentColor = Colors.deepPurpleAccent;

  bool isGameOver = false;

  void randomUpdateBackground() {
    Set<Color> validColors = {...bgColors};
    validColors.remove(currentColor);
    int newBgIndex = Random().nextInt(validColors.length);
    setState(() {
      currentColor = validColors.elementAt(newBgIndex);
    });
  }

  void handleTap() {
    widget.game.nextRound();
    randomUpdateBackground();
  }

  void handleSwipeBack(DragEndDetails details) {
    // Swipe is to the left
    if (details.primaryVelocity! < 0) {
      widget.game.previousRound();
      randomUpdateBackground();
    } else {
      widget.game.nextRound();
      randomUpdateBackground();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => handleTap(),
        onVerticalDragUpdate: (details) {},
        onHorizontalDragEnd: (details) => handleSwipeBack(details),
        child: Scaffold(
            backgroundColor: currentColor,
            body: Center(
                child: widget.game.isGameOver
                    ? const GameOver()
                    : SingleChildScrollView(
                        child: Text(widget.game.currentPrompt,
                            textAlign: TextAlign.center,
                            style: Styles.getPromptTextStyle())))));
  }
}
