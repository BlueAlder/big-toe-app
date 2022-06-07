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

  void handleSubmitPlayer(BuildContext context, String playerName) {
    if (playerName.isNotEmpty) {
      textController.text = "";
      widget.addPlayer(context, playerName);
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
      onSubmitted: (value) => handleSubmitPlayer(context, value),
      onEditingComplete: (){},
      maxLength: 20,

      textAlign: TextAlign.center,
      style: styles.getRegularTextStyle(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        // labelText: 'Gamer',
        hintText: "Add a player",
        // filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {handleSubmitPlayer(context, textController.text)}),
      ),
    );
  }
}


