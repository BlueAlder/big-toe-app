import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import '../shared/utils.dart' as utils;

part 'game.model.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  Game({
    this.gameType = "picante",
  });

  // Firebase fields
  Set<String> players = {};
  Set<String> prompts = {};
  int totalRounds = 10;
  final String gameType;
  DateTime created = DateTime.now();

  // Local fields
  @JsonKey(ignore: true)
  int roundNumber = 1;
  @JsonKey(ignore: true)
  bool isGameOver = false;

  bool get isReadyToPlay {
    return players.length > 1;
  }

  String get currentPrompt {
    return prompts.elementAt(roundNumber - 1);
  }


  Game nextRound() {
    if (roundNumber < totalRounds) {
      roundNumber++;
    } else {
      isGameOver = true;
    }
    return this;
  }

  Game previousRound() {
    if (roundNumber > 1) {
      roundNumber--;
      isGameOver = false;
    }

    return this;
  }

  Game changeTotalRounds(int roundDelta) {
    int newRoundAmount = totalRounds + roundDelta;
    if (newRoundAmount <= 100 && newRoundAmount > 0) {
      totalRounds = newRoundAmount;
    }
    return this;
  }

  Game addPlayer(String playerName) {
    if (players.length < 8) {
      players.add(playerName);
    } else {
      // TODO: Show error message of max 8 players.
    }

    return this;
  }

  Game addPrompts(Set<String> newPrompts) {
    if (newPrompts.length != totalRounds) {
      totalRounds = newPrompts.length;
    }

    prompts = newPrompts.map((prompt) => _formatPrompt(prompt)).toSet();
    return this;
  }

  Game resetGameRound() {
    roundNumber = 1;
    isGameOver = false;

    return this;
  }

  String _formatPrompt(String prompt) {
    const replacementKeyword = "\$NAME";
    final availablePlayers = {...players};
    print(availablePlayers);

    if (prompt.toUpperCase().contains(replacementKeyword)) {
      while(prompt.contains(replacementKeyword) && availablePlayers.isNotEmpty) {
        final selectedPlayer = utils.getRandomElementFromArray(availablePlayers) as String;
        prompt = prompt.replaceFirst(replacementKeyword, selectedPlayer);
        availablePlayers.remove(selectedPlayer);
      }
    } else {
      prompt = (utils.getRandomElementFromArray(availablePlayers) as String) + prompt;
    }
    return prompt;
  }

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);

  Map<String, Object?> toJson() => _$GameToJson(this);
}
