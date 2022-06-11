import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:big_toe_mobile/src/models/prompt.model.dart';
import 'package:big_toe_mobile/src/models/game.model.dart';

import 'game.model_test.mocks.dart';


@GenerateMocks([Prompt])
void main() {
  late Game game;
  setUp(() {
    return game = Game();
  });

  group("Next Round Function", () {
    test("Should go to next round at the start of game", () {
      expect(game.roundNumber, 1);
      game.nextRound();
      expect(game.roundNumber, 2);
      expect(game.isGameOver, false);
    });

    test("Should not go to next round if at the end of the game", () {
      // Check that we can go to next round multiple times
      for (int i = 0; i < game.totalRounds + 10; i++) {
        game.nextRound();
      }
      expect(game.roundNumber, game.totalRounds);
      expect(game.isGameOver, true);
    });
  });

  group("Previous Round ", () {
    // Normal case
    test("Should go to previous round", () {
      game.nextRound();

      expect(game.roundNumber, 2);
      expect(game.isGameOver, false);

      game.previousRound();

      expect(game.roundNumber, 1);
      expect(game.isGameOver, false);
    });

    test("Previous round when at the end of the game", () {
      for (int i = 0; i < game.totalRounds; i++) {
        game.nextRound();
      }

      expect(game.roundNumber, game.totalRounds);
      expect(game.isGameOver, true);

      game.previousRound();

      expect(game.roundNumber, game.totalRounds - 1);
      expect(game.isGameOver, false);
    });

    test("Previous round when at the start of the game", () {
      game.previousRound();

      expect(game.roundNumber, 1);
      expect(game.isGameOver, false);
    });
  });

  group("Changing Rounds", () {
    test("Adding 10 rounds within bounds", () {
      final previousTotalRounds = game.totalRounds;

      const incrementValue = 10;

      expect(Game.maxRoundCount,
          greaterThan(previousTotalRounds + incrementValue));

      // Add 10 rounds
      game.changeTotalRounds(incrementValue);
      expect(game.totalRounds, previousTotalRounds + incrementValue);
    });

    test("Adding more rounds than max rounds", () {
      const incrementValue = Game.maxRoundCount + 10;

      game.changeTotalRounds(incrementValue);
      expect(game.totalRounds, Game.maxRoundCount);
    });

    test("Removing more rounds than min rounds", () {
      const incrementValue = -9999;

      game.changeTotalRounds(incrementValue);
      expect(game.totalRounds, Game.minRoundCount);
    });
  });

  group("Adding a new player", () {
    test("Adding a new player base case", () {
      const newPlayerName = "Ya mum";

      expect(game.players.length, 0);
      game.addPlayer(newPlayerName);
      expect(game.players.length, 1);
      expect(game.players.elementAt(0), newPlayerName);
    });

    test("Adding multiple new players base case", () {
      const newPlayerName = "Ya mum";

      expect(game.players.length, 0);

      for (int i = 0; i < Game.maxPlayers; i++) {
        game.addPlayer(newPlayerName + i.toString());
      }

      expect(game.players.length, Game.maxPlayers);
    });

    test("Adding a player greater than the limit", () {
      const newPlayerName = "Ya mum";

      expect(game.players.length, 0);

      for (int i = 0; i < Game.maxPlayers; i++) {
        game.addPlayer(newPlayerName + i.toString());
      }

      expect(() => game.addPlayer("9th player"),
          throwsA(isA<TooManyPlayersException>()));
    });

    test("Removing a player", () {
      const newPlayer1 = "newPlayer1";
      const newPlayer2 = "newPlayer2";
      game.addPlayer(newPlayer1);
      game.addPlayer(newPlayer2);

      expect(game.players.length, equals(2));

      game.removePlayer(newPlayer1);

      expect(game.players.length, equals(1));
      expect(game.players.elementAt(0), equals(newPlayer2));
    });

    test("Removing a player that doesn't exist", () {
      const newPlayer1 = "newPlayer1";
      const newPlayer2 = "newPlayer2";
      game.addPlayer(newPlayer1);
      game.addPlayer(newPlayer2);

      expect(game.players.length, equals(2));

      expect(() => game.removePlayer("fake player"), throwsException);
      expect(game.players.length, equals(2));
    });
  });

  const replacementKeyword = "\$NAME";
  group("Adding Prompts", () {
    test("Verify adding single prompt with at least 1 player", () {
      const playerName = "test_player";
      game.addPlayer(playerName);

      const promptValue = "a test prompt";
      final mockPrompt = MockPrompt();
      when(mockPrompt.formatPrompt(game.players)).thenReturn(Prompt(promptValue));
      game.setPrompts([mockPrompt]);

      expect(game.prompts.elementAt(0), equals(promptValue));
      expect(game.totalRounds, 1);
    });

    test("Verify all prompts do not have the replacement keyword", () {
      const playerName1 = "test_player1";
      game.addPlayer(playerName1);
      const playerName2 = "test_player2";
      game.addPlayer(playerName2);

      game.setPrompts(fakePrompts);

      for (String prompt in game.prompts) {
        expect(prompt.contains(replacementKeyword), false);
      }
    });

    test("Each prompt has at least 1 player name in them", () {
      const playerName1 = "test_player1";
      game.addPlayer(playerName1);
      const playerName2 = "test_player2";
      game.addPlayer(playerName2);

      game.setPrompts(fakePrompts);
      for (String prompt in game.prompts) {
        expect(
            prompt.contains(playerName1) || prompt.contains(playerName2), true);
      }
    });

  });

  group("Changing Game Tags", () {
    test("Adding tags to a game", () {
      const tags = {'tag1', 'tag2'};
      expect(game.tags.length, equals(0));

      game.setTags(tags);
      expect(game.tags.length, equals(2));
    });

    test("Removing tags from a game", () {
      const tags = {'tag1', 'tag2'};
      expect(game.tags.length, equals(0));

      game.setTags(tags);
      expect(game.tags.length, equals(2));

      game.setTags({});
      expect(game.tags.length, equals(0));
    });

  });

  group("Reseting game", () {
    test("Resetting the game round", () {
      game.nextRound();
      game.nextRound();

      expect(game.roundNumber, greaterThan(1));

      game.resetGameRound();

      expect(game.roundNumber, equals(1));
      expect(game.isGameOver, equals(false));
    });
  });
}

final fakePrompts = [
  Prompt("ya dilly dally"),
  Prompt("ya whoopsie doopsie"),
  Prompt("seriously \$NAME what the heckare you doing"),
  Prompt("okay this is epic \$NAME"),
];
