import 'package:cloud_firestore_odm/annotation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../models/game.model.dart';
import '../services/game.service.dart';
import '../shared/styles.dart' as styles;
import '../game/game.page.dart';
import 'player-list.widget.dart';
import 'game-length.widget.dart';
import 'add-player.widget.dart';

GameService gameService = GetIt.I.get<GameService>();

class GameSetupPage extends StatefulWidget {
  const GameSetupPage({Key? key}) : super(key: key);

  @override
  State<GameSetupPage> createState() => _GameSetupPageState();
}

class _GameSetupPageState extends State<GameSetupPage> {

  final Game _game = Game();
  bool loadingGame = false;

  void incrementRounds(int amountToIncrement) {
    setState(() {
      _game.changeTotalRounds(amountToIncrement);
    });
  }

  void addPlayer(String playerName) {
    setState(() {
      _game.addPlayer(playerName);
    });
  }

  Future<void> handleStartGame(BuildContext context) async {
    setState(() {
      loadingGame = true;
    });

    try {
      final populatedGame = await gameService.createNewGame(_game);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return GamePage(game: populatedGame,);
          }));
    } catch(e) {
      print(e);
    } finally {
      setState(() {
        loadingGame = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        // resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Game Setup", style: styles.getHeadingStyle()),
                GameLengthSetting(
                    numRounds: _game.totalRounds, incrementFn: incrementRounds),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: AddPlayer(addPlayer: addPlayer),
                ),
                PlayerList(players: _game.players)
              ],
            )),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Center(
                  child: loadingGame ? const Text("Loading Game") : ElevatedButton(
                      onPressed: _game.isReadyToPlay ? () => handleStartGame(context) : null,
                      child: styles.getElevatedButtonChild("Start Game"),
                      style: styles.getElevatedButtonStyle())),
              const SizedBox(height: 10)
            ]),
          ],
        ));
  }
}
