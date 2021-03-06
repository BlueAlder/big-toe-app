import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:get_it/get_it.dart';

import '../services/prompt.service.dart';
import '../models/game.model.dart';

part 'game.service.g.dart';

@Collection<Game>('games-app')
final gamesRef = GameCollectionReference();

class GameService {
  final _promptService = GetIt.I.get<PromptService>();

  Future<Game> createNewGame(Game game) async {
    final prompts = await _promptService.getRandomPromptsFilteredByTags(
        game.totalRounds, game.tags);
    game.resetGameRound();
    game.setPrompts(prompts);
    gamesRef.add(game);
    return game;
  }
}
