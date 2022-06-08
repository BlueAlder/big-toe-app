import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:big_toe_mobile/shared/utils.dart';

import '../models/prompt.model.dart';

class PromptService {
  late final FirebaseFirestore db;

  PromptService(FirebaseFirestore instance) {
    db = instance;
  }

  final String promptCollectionName = kReleaseMode ? 'prompts' : 'prompts-test';
  final String statsDocumentId = "--stats--";

  Future<List<Prompt>> getPrompts(int amountOfPrompts) async {
    final promptCount = await _getPromptCount();

    // We want a list as we think that it is okay to repeat prompts.
    // Ideally this will reduce as prompts increase and game size remain the same
    final promptIds = Utils.generateRandomIntList(amountOfPrompts, promptCount);

    final promptFutures = promptIds.map((promptId) {
      return db.doc('$promptCollectionName/$promptId').get().then((promptDoc) {
        final data = promptDoc.data() as Map<String, dynamic>;
        return Prompt(data['prompt'], id: promptId);
      });
    });
    return await Future.wait(promptFutures);
  }

  void addPrompt(String prompt) async {
    final promptCount = await _getPromptCount();
    final increment1 = FieldValue.increment(1);

    // Since the number of prompts will be the id of the NEXT prompt
    final promptRef = _getDocumentReference(promptCount.toString());

    final batch = db.batch();
    batch.set(promptRef, {"prompt": prompt});
    batch.set(_getDocumentReference(statsDocumentId), {"count": increment1},
        SetOptions(merge: true));
    batch.commit();
  }

  Stream<DocumentSnapshot<Object?>> getStatsSnapshots() {
    return _getDocumentReference(statsDocumentId).snapshots();
  }

  Future<int> _getPromptCount() async {
    final statsSnapshot = await _getDocumentReference(statsDocumentId).get();
    final statsData = statsSnapshot.data() as Map<String, dynamic>;
    return statsData['count'] as int;
  }

  DocumentReference _getDocumentReference(String id) {
    return db.collection(promptCollectionName).doc(id);
  }
}
