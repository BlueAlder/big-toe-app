import 'package:cloud_firestore_odm/annotation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../models/game.model.dart';
import '../services/game.service.dart';
import '../services/notification.service.dart';
import '../shared/styles.dart' as styles;
import '../game/game.page.dart';
import 'player-list.widget.dart';
import 'game-length.widget.dart';
import 'add-player.widget.dart';

final gameService = GetIt.I.get<GameService>();
final notificationService = GetIt.I.get<NotificationService>();

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

  void addPlayer(BuildContext context, String playerName) {
    setState(() {
      try {
      _game.addPlayer(playerName);
      } on TooManyPlayersException  {
        notificationService.showSnackBarMessage("Cannot have more than 8 players in a game", context);
      }
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
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Text("Game Setup", style: styles.getHeadingStyle()),
                GameLengthSetting(
                    numRounds: _game.totalRounds, incrementFn: incrementRounds),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: AddPlayer(addPlayer: addPlayer),
                ),
                Expanded(child: PlayerList(players: _game.players))
              ],
            )),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Center(
                  child: loadingGame ? const CircularProgressIndicator(color: Colors.orange,) : ElevatedButton(
                      onPressed: _game.isReadyToPlay ? () => handleStartGame(context) : null,
                      child: styles.getElevatedButtonChild("Start Game"),
                      style: styles.getElevatedButtonStyle())),
              const SizedBox(height: 10)
            ]),
          ],
        ));
  }
}
