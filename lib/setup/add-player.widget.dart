import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/game.service.dart';
import '../shared/styles.dart';
import '../shared/utils.dart';

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
      onEditingComplete: () {},
      maxLength: 20,
      textAlign: TextAlign.center,
      style: Styles.getRegularTextStyle(),
      decoration: Utils.mergeInputDecoration(
          Styles.getTextFieldDecorationStyle(),
          InputDecoration(
            hintText: "Add a player",
            suffixIcon: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () =>
                    {handleSubmitPlayer(context, textController.text)}),
          )),
    );
  }
}
