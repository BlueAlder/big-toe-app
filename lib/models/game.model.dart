import 'package:big_toe_mobile/models/prompt.model.dart';
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

  // This cannot be instances of [Prompt] as it does not serialize with the
  // Firestore ODM.
  List<String> prompts = [];
  int totalRounds = minRoundCount;
  final String gameType;
  DateTime created = DateTime.now();

  // Local fields
  @JsonKey(ignore: true)
  int _roundNumber = 1;
  @JsonKey(ignore: true)
  bool isGameOver = false;

  // Static Fields
  static const maxPlayers = 10;
  static const minRoundCount = 10;
  static const maxRoundCount = 100;
  static const promptPlaceholderWord = "\$NAME";


  // Getters
  bool get isReadyToPlay {
    return players.length > 1;
  }

  String get currentPrompt {
    return prompts.elementAt(_roundNumber - 1);
  }

  int get roundNumber {
    return _roundNumber;
  }


  Game nextRound() {
    if (_roundNumber < totalRounds) {
      _roundNumber++;
    } else {
      isGameOver = true;
    }
    return this;
  }

  Game previousRound() {
    if (_roundNumber > 1) {
      _roundNumber--;
      isGameOver = false;
    }

    return this;
  }

  Game changeTotalRounds(int roundDelta) {
    int newRoundAmount = totalRounds + roundDelta;
    if (newRoundAmount > maxRoundCount){
      totalRounds = maxRoundCount;
    } else if (newRoundAmount <= 0) {
      totalRounds = minRoundCount;
    } else {
      totalRounds = newRoundAmount;
    }
    return this;
  }

  Game addPlayer(String playerName) {
    if (players.length < maxPlayers) {
      players.add(playerName);
    } else {
      throw TooManyPlayersException();
    }
    return this;
  }

  Game removePlayer(String playerName) {
    return players.remove(playerName) ? this : throw Exception("Player not found");
    return this;
  }

  Game setPrompts(List<Prompt> newPrompts) {
    if (newPrompts.length != totalRounds) {
      totalRounds = newPrompts.length;
    }

    prompts = newPrompts.map((prompt) => prompt.formatPrompt(players).text).toList();
    return this;
  }

  Game resetGameRound() {
    _roundNumber = 1;
    prompts = [];
    isGameOver = false;

    return this;
  }


  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);

  Map<String, Object?> toJson() => _$GameToJson(this);
}

class TooManyPlayersException implements Exception {

}