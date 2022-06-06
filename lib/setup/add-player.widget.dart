import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/game.service.dart';
import '../shared/styles.dart' as styles;

GameService gameService = GetIt.I.get<GameService>();

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key, required this.addPlayer}) : super(key: key);
  final Function addPlayer;

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final textController = TextEditingController();

  void handleSubmitPlayer(String playerName) {
    if (playerName.isNotEmpty) {
      textController.text = "";
      widget.addPlayer(playerName);
    }

  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: handleSubmitPlayer,
      onEditingComplete: (){},
      maxLength: 20,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Gamer',
        suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {handleSubmitPlayer(textController.text)}),
      ),
    );
  }
}


