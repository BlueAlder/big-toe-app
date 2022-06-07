import 'package:big_toe_mobile/models/game.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Game game;
  setUp(() => game = Game());

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
  });

  const replacementKeyword = "\$NAME";
  group("Adding Prompts", () {
    test("Verify adding single prompt with at least 1 player", () {
      const playerName = "test_player";
      game.addPlayer(playerName);

      const promptValue = "verify $replacementKeyword should be changed";
      game.addPrompts({promptValue});

      expect(game.prompts.elementAt(0), "verify test_player should be changed");
      expect(game.totalRounds, 1);
    });

    test("Verify all prompts do not have the replacement keyword", () {
      const playerName1 = "test_player1";
      game.addPlayer(playerName1);
      const playerName2 = "test_player2";
      game.addPlayer(playerName2);

      game.addPrompts(fakePrompts);

      for (String prompt in game.prompts) {
        expect(prompt.contains(replacementKeyword), false);
      }
    });

    test("Each prompt has at least 1 player name in them", () {
      const playerName1 = "test_player1";
      game.addPlayer(playerName1);
      const playerName2 = "test_player2";
      game.addPlayer(playerName2);

      game.addPrompts(fakePrompts);
      for (String prompt in game.prompts) {
        expect(
            prompt.contains(playerName1) || prompt.contains(playerName2), true);
      }
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

const fakePrompts = {
  "ya dilly dally",
  "ya whoopsie doopsie",
  "seriously \$NAME what the heckare you doing",
  "okay this is epic \$NAME",
};
