import 'package:big_toe_mobile/services/prompt.service.dart';
import 'package:big_toe_mobile/shared/utils.dart' as utils;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../models/game.model.dart';

part 'game.service.g.dart';

@Collection<Game>('games-app')
final gamesRef = GameCollectionReference();

class GameService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final _promptService = GetIt.I.get<PromptService>();

  Future<Game> createNewGame(Game game) async {
    final prompts = await _promptService.getPrompts(game.totalRounds);
    game.resetGameRound();
    game.addPrompts({...prompts});
    gamesRef.add(game);
    return game;
  }


}
