import 'package:flutter/material.dart';
import '../shared/styles.dart' as styles;
import 'package:animated_text_kit/animated_text_kit.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({Key? key, required this.players}) : super(key: key);
  final Set<String> players;

  @override
  Widget build(BuildContext context) {
    if (players.isNotEmpty) {
      return Column(

          children: [
        Text("Our Players", style: styles.getRegularTextStyle()),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: (1 / 0.2),
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(players.length, (index) {
            return Center(
                child: AnimatedTextKit(
                  animatedTexts: [WavyAnimatedText(players.elementAt(index), textStyle: styles.getRegularTextStyle())],
                  repeatForever: true,
                ));
          }),
        )
      ]);
    } else {
      return Center(child: Text("No gamers yet", style: styles.getRegularTextStyle()));
    }
  }
}