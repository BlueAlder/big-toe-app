import 'package:json_annotation/json_annotation.dart';

import '../models/prompt.model.dart';

part 'game.model.g.dart';

/// A model class to represent and instance of a Big Toe Game.
@JsonSerializable(explicitToJson: true)
class Game {
  Game();

  // Firebase Fields
  /// The names of all players who are in the game.
  Set<String> players = {};

  /// The list of prompts that will be presented for the game. Note that the
  /// elements are of type [Prompt]. Reason being is that the Firestore ODM for
  /// Flutter does not support nested Objects in classes.
  List<String> prompts = [];

  /// The number of rounds in the game.
  ///
  /// This is different from just [prompts.length] since during configuration of
  /// the game we want to be able to set the desired amount of rounds before
  /// we have set the prompts.
  int totalRounds = defaultRoundCount;

  /// Tags are the types of prompts which we are playing with.
  Set<String> tags = {};

  /// Time that the game was created.
  DateTime created = DateTime.now();

  // Local fields

  /// The current round number of the game.
  @JsonKey(ignore: true)
  int _roundNumber = 1;

  /// Bool to check whether the game is over or not.
  @JsonKey(ignore: true)
  bool isGameOver = false;

  // Static Fields

  /// Maximum number of players in a game
  static const maxPlayers = 10;

  /// Default number of rounds for a new game
  static const defaultRoundCount = 30;

  /// Minimum number of players in a game
  static const minRoundCount = 10;

  /// Maximum number of rounds in a game.
  static const maxRoundCount = 100;

  // Getters

  /// Checks if game has enough players to start.
  bool get isReadyToPlay => players.length > 1;

  String get currentPrompt => prompts.elementAt(_roundNumber - 1);

  int get roundNumber => _roundNumber;

  /// Moves to the next round of the game.
  ///
  /// If we are at the end of the game, will set [isGameOver] to true.
  Game nextRound() {
    if (_roundNumber < totalRounds) {
      _roundNumber++;
    } else {
      isGameOver = true;
    }
    return this;
  }

  /// Moves to the previous round of the game
  ///
  /// Always sets [isGameOver] to false, if at the start of the game, nothing
  /// should change.
  Game previousRound() {
    if (_roundNumber > 1) {
      _roundNumber--;
    }

    isGameOver = false;
    return this;
  }

  /// Changes the total game rounds by a delta of [roundDelta]
  Game changeTotalRounds(int roundDelta) {
    int newRoundAmount = totalRounds + roundDelta;
    if (newRoundAmount > maxRoundCount) {
      totalRounds = maxRoundCount;
    } else if (newRoundAmount <= 0) {
      totalRounds = minRoundCount;
    } else {
      totalRounds = newRoundAmount;
    }
    return this;
  }

  /// Add's a new player with name [playerName] to the player list
  Game addPlayer(String playerName) {
    if (players.length < maxPlayers) {
      players.add(playerName);
    } else {
      throw TooManyPlayersException();
    }
    return this;
  }

  /// Removes a player with name [playerName] from the player list
  ///
  /// Throws [Exception] if the player was not found in the list.
  Game removePlayer(String playerName) {
    return players.remove(playerName)
        ? this
        : throw Exception("Player not found");
  }

  /// Replaces the current [Prompt] list with [newPrompts]
  ///
  /// All the prompts are formatted with the [players] list.
  /// This also sets the [totalRounds] for the game to be the length of the list.
  Game setPrompts(List<Prompt> newPrompts) {
    if (newPrompts.length != totalRounds) {
      totalRounds = newPrompts.length;
    }

    prompts =
        newPrompts.map((prompt) => prompt.formatPrompt(players).text).toList();
    return this;
  }

  Game setTags(Set<String> newTags) {
    tags = newTags;
    return this;
  }

  /// Resets the game back to the start
  Game resetGameRound() {
    _roundNumber = 1;
    prompts = [];
    isGameOver = false;

    return this;
  }

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);

  Map<String, Object?> toJson() => _$GameToJson(this);
}

class TooManyPlayersException implements Exception {}
