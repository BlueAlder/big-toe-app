import 'package:big_toe_mobile/shared/utils.dart' as utils;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/foundation.dart';

import '../models/game.model.dart';

part 'game.service.g.dart';

@Collection<Game>('games-app')
final gamesRef = GameCollectionReference();

class GameService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final String promptCollectionName = kReleaseMode? 'prompts' : 'prompts-test';

  Future<Game> createNewGame(Game game) async {
    final prompts = await getPrompts(game.totalRounds);
    game.resetGameRound();
    game.addPrompts({...prompts});
    gamesRef.add(game);
    return game;
    // gamesRef.add(_newGame);
    // return _newGame;
  }

  Future<List<String>> getPrompts(int amountOfPrompts) async {
    DocumentSnapshot numPromptsDoc = await _getStatsSnapshot();
    final totalPromptCount = numPromptsDoc.data() as Map<String, dynamic>;

    final promptIds = utils.generateRandomIntSet(
        amountOfPrompts, totalPromptCount['count']!);

    print(promptIds);

    final promptFutures = promptIds.map((promptId) {
      return db.doc('$promptCollectionName/$promptId').get().then((promptDoc) {
        final data = promptDoc.data() as Map<String, dynamic>;
        return data['prompt'] as String;
      });
    });
    return await Future.wait(promptFutures);
  }

  Future<DocumentSnapshot> _getStatsSnapshot() {
    return db.collection(promptCollectionName).doc('--stats--').get();
  }
}
