import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../shared/utils.dart';
import '../models/prompt.model.dart';
import 'firestore.service.dart';

class PromptService {
  // late final FirebaseFirestore db;
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();

  final String promptCollectionName = kReleaseMode ? 'prompts' : 'prompts-test';
  final String statsDocumentId = "--stats--";

  CollectionReference get collectionReference =>
      _firestoreService.db.collection(promptCollectionName);

  Future<List<Prompt>> getRandomPromptsFilteredByTags(
      int amountOfPrompts, Set<String> tags) async {
    final generalPromptCount = await _getPromptCount();
    final Map<String, int> promptCounts = {'general': generalPromptCount};

    // TODO could paralise and await all the results
    for (var tag in tags) {
      final tagPromptCount = await _getPromptCount(tag: tag);
      promptCounts[tag] = tagPromptCount;
    }

    final totalPromptCount =
        promptCounts.values.reduce((total, count) => total += count);

    // We want a list as we think that it is okay to repeat prompts.
    // Ideally this will reduce as prompts increase and game size remain the same
    final promptIds =
        Utils.generateRandomIntList(amountOfPrompts, totalPromptCount);

    final promptFutures = promptIds.map((promptId) {
      if (promptId < generalPromptCount) {
        return _getPromptDocumentSnapshot('$promptId').then((promptDoc) {
          final data = promptDoc.data() as Map<String, dynamic>;
          return Prompt(data['prompt'], id: promptId);
        });
      }

      int reducedPromptId = promptId - generalPromptCount;

      for (var tag in promptCounts.entries) {
        if (tag.key == "general") continue;
        if (reducedPromptId < tag.value) {
          return _getTagPromptDocumentSnapshot('$reducedPromptId', tag.key)
              .then((promptDoc) {
            final data = promptDoc.data() as Map<String, dynamic>;
            return Prompt(data['prompt'], id: promptId);
          });
        }

        reducedPromptId -= tag.value;
      }
    });

    final promptFuturesNonNull = promptFutures.whereType<Future<Prompt>>();
    return await Future.wait(promptFuturesNonNull);
  }

  void addPrompt(Prompt prompt) {
    if (prompt.tags.isNotEmpty) {
      for (var tag in prompt.tags) {
        _addPromptWithTag(prompt, tag);
      }
    } else {
      _addPrompt(prompt);
    }
  }

  void _addPrompt(Prompt prompt) async {
    final promptCount = await _getPromptCount();
    final increment1 = FieldValue.increment(1);

    // Since the number of prompts will be the id of the NEXT prompt
    final promptRef = _getPromptDocumentReference(promptCount.toString());

    final batch = _firestoreService.db.batch();
    batch.set(promptRef, prompt.toJson());
    batch.set(_getPromptDocumentReference(statsDocumentId),
        {"count": increment1}, SetOptions(merge: true));
    batch.commit();
  }

  Future<void> _addPromptWithTag(Prompt prompt, String tag) async {
    final tagPromptCount = await _getPromptCount(tag: tag);

    final increment1 = FieldValue.increment(1);

    // Since the number of prompts will be the id of the NEXT prompt
    final promptRef =
        _getTagPromptDocumentReference(tagPromptCount.toString(), tag);

    final batch = _firestoreService.db.batch();
    batch.set(promptRef, prompt.toJson());
    batch.set(_getTagPromptDocumentReference(statsDocumentId, tag),
        {"count": increment1}, SetOptions(merge: true));
    batch.commit();
  }

  Stream<DocumentSnapshot<Object?>> getStatsSnapshots() {
    return _getPromptDocumentReference(statsDocumentId).snapshots();
  }

  Future<int> _getPromptCount({String? tag}) async {
    final statsSnapshot = tag != null
        ? await _getTagPromptDocumentSnapshot(statsDocumentId, tag)
        : await _getPromptDocumentSnapshot(statsDocumentId);
    if (statsSnapshot.data() == null) {
      return 0;
    }
    final statsData = statsSnapshot.data() as Map<String, dynamic>;
    return statsData['count'] as int;
  }

  DocumentReference _getPromptDocumentReference(String id) {
    return _firestoreService.getDocumentReference(promptCollectionName, id);
  }

  Future<DocumentSnapshot> _getPromptDocumentSnapshot(String id) {
    return _firestoreService.getDocumentSnapshot(promptCollectionName, id);
  }

  DocumentReference _getTagPromptDocumentReference(String id, String tag) {
    return _getPromptDocumentReference(tag).collection('prompts').doc(id);
  }

  Future<DocumentSnapshot> _getTagPromptDocumentSnapshot(
      String id, String tag) {
    return _getPromptDocumentReference(tag).collection('prompts').doc(id).get();
  }
}
