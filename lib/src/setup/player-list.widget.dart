import 'package:flutter/material.dart';
import '../models/game.model.dart';
import '../shared/styles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PlayerList extends StatefulWidget {
  const PlayerList({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  void handleDeletePlayer(String player) {
    setState(() {
      widget.game.removePlayer(player);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.game.players.isNotEmpty) {
      return SingleChildScrollView(
          child: Column(children: [
            Text("Our Players", style: Styles.getRegularTextStyle()),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: (1 / 0.2),
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(widget.game.players.length, (index) {
                final playerName = widget.game.players.elementAt(index);
                return Row(
                  key: Key(playerName),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(playerName,
                            textStyle: Styles.getRegularTextStyle())
                      ],
                      repeatForever: true,
                    ),
                    IconButton(
                        onPressed: () =>
                            handleDeletePlayer(playerName),
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.orangeAccent,
                        ))
                  ],
                );
              }),
            )
          ]));
    } else {
      return
          Text("No gamers yet", style: Styles.getRegularTextStyle());
    }
  }
}