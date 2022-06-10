// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.service.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GameCollectionReference
    implements GameQuery, FirestoreCollectionReference<GameQuerySnapshot> {
  factory GameCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GameCollectionReference;

  static Game fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Game.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Game value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  GameDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GameDocumentReference> add(Game value);
}

class _$GameCollectionReference extends _$GameQuery
    implements GameCollectionReference {
  factory _$GameCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GameCollectionReference._(
      firestore.collection('games-app').withConverter(
            fromFirestore: GameCollectionReference.fromFirestore,
            toFirestore: GameCollectionReference.toFirestore,
          ),
    );
  }

  _$GameCollectionReference._(
    CollectionReference<Game> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Game> get reference =>
      super.reference as CollectionReference<Game>;

  @override
  GameDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GameDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GameDocumentReference> add(Game value) {
    return reference.add(value).then((ref) => GameDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GameDocumentReference
    extends FirestoreDocumentReference<GameDocumentSnapshot> {
  factory GameDocumentReference(DocumentReference<Game> reference) =
      _$GameDocumentReference;

  DocumentReference<Game> get reference;

  /// A reference to the [GameCollectionReference] containing this document.
  GameCollectionReference get parent {
    return _$GameCollectionReference(reference.firestore);
  }

  @override
  Stream<GameDocumentSnapshot> snapshots();

  @override
  Future<GameDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    List<String> prompts,
    int totalRounds,
    bool isGameOver,
    int maxPlayers,
    int minRoundCount,
    int maxRoundCount,
    String promptPlaceholderWord,
    bool isReadyToPlay,
    String currentPrompt,
    int roundNumber,
  });

  Future<void> set(Game value);
}

class _$GameDocumentReference
    extends FirestoreDocumentReference<GameDocumentSnapshot>
    implements GameDocumentReference {
  _$GameDocumentReference(this.reference);

  @override
  final DocumentReference<Game> reference;

  /// A reference to the [GameCollectionReference] containing this document.
  GameCollectionReference get parent {
    return _$GameCollectionReference(reference.firestore);
  }

  @override
  Stream<GameDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return GameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<GameDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return GameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? prompts = _sentinel,
    Object? totalRounds = _sentinel,
    Object? isGameOver = _sentinel,
    Object? maxPlayers = _sentinel,
    Object? minRoundCount = _sentinel,
    Object? maxRoundCount = _sentinel,
    Object? promptPlaceholderWord = _sentinel,
    Object? isReadyToPlay = _sentinel,
    Object? currentPrompt = _sentinel,
    Object? roundNumber = _sentinel,
  }) async {
    final json = {
      if (prompts != _sentinel) "prompts": prompts as List<String>,
      if (totalRounds != _sentinel) "totalRounds": totalRounds as int,
      if (isGameOver != _sentinel) "isGameOver": isGameOver as bool,
      if (maxPlayers != _sentinel) "maxPlayers": maxPlayers as int,
      if (minRoundCount != _sentinel) "minRoundCount": minRoundCount as int,
      if (maxRoundCount != _sentinel) "maxRoundCount": maxRoundCount as int,
      if (promptPlaceholderWord != _sentinel)
        "promptPlaceholderWord": promptPlaceholderWord as String,
      if (isReadyToPlay != _sentinel) "isReadyToPlay": isReadyToPlay as bool,
      if (currentPrompt != _sentinel) "currentPrompt": currentPrompt as String,
      if (roundNumber != _sentinel) "roundNumber": roundNumber as int,
    };

    return reference.update(json);
  }

  Future<void> set(Game value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class GameDocumentSnapshot extends FirestoreDocumentSnapshot {
  GameDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Game> snapshot;

  @override
  GameDocumentReference get reference {
    return GameDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Game? data;
}

abstract class GameQuery implements QueryReference<GameQuerySnapshot> {
  @override
  GameQuery limit(int limit);

  @override
  GameQuery limitToLast(int limit);

  GameQuery wherePrompts({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  GameQuery whereTotalRounds({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  GameQuery whereIsGameOver({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  GameQuery whereMaxPlayers({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  GameQuery whereMinRoundCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  GameQuery whereMaxRoundCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  GameQuery wherePromptPlaceholderWord({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereIsReadyToPlay({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  GameQuery whereCurrentPrompt({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereRoundNumber({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  GameQuery orderByPrompts({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByTotalRounds({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByIsGameOver({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByMaxPlayers({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByMinRoundCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByMaxRoundCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByPromptPlaceholderWord({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByIsReadyToPlay({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByCurrentPrompt({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByRoundNumber({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });
}

class _$GameQuery extends QueryReference<GameQuerySnapshot>
    implements GameQuery {
  _$GameQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Game> reference;

  GameQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Game> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return GameQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<GameDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: GameDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return GameQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<GameQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<GameQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  GameQuery limit(int limit) {
    return _$GameQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  GameQuery limitToLast(int limit) {
    return _$GameQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  GameQuery wherePrompts({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$GameQuery(
      reference.where(
        'prompts',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  GameQuery whereTotalRounds({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'totalRounds',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereIsGameOver({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'isGameOver',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereMaxPlayers({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'maxPlayers',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereMinRoundCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'minRoundCount',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereMaxRoundCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'maxRoundCount',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery wherePromptPlaceholderWord({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'promptPlaceholderWord',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereIsReadyToPlay({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'isReadyToPlay',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereCurrentPrompt({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'currentPrompt',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery whereRoundNumber({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      reference.where(
        'roundNumber',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  GameQuery orderByPrompts({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('prompts', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByTotalRounds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('totalRounds', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByIsGameOver({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isGameOver', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByMaxPlayers({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('maxPlayers', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByMinRoundCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('minRoundCount', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByMaxRoundCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('maxRoundCount', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByPromptPlaceholderWord({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('promptPlaceholderWord', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByIsReadyToPlay({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isReadyToPlay', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByCurrentPrompt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('currentPrompt', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  GameQuery orderByRoundNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('roundNumber', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$GameQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GameQuerySnapshot
    extends FirestoreQuerySnapshot<GameQueryDocumentSnapshot> {
  GameQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Game> snapshot;

  @override
  final List<GameQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GameDocumentSnapshot>> docChanges;
}

class GameQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements GameDocumentSnapshot {
  GameQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Game> snapshot;

  @override
  GameDocumentReference get reference {
    return GameDocumentReference(snapshot.reference);
  }

  @override
  final Game data;
}
