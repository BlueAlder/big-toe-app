import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:big_toe_mobile/src/services/prompt.service.dart';

import 'game.service_test.mocks.dart';

@GenerateMocks([FirebaseFirestore, PromptService])
void main() {
  test("Create a new game", () {
    final instance = MockFirebaseFirestore();
  });
}
