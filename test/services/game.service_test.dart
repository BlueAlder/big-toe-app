

import 'package:big_toe_mobile/services/prompt.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game.service_test.mocks.dart';

@GenerateMocks([FirebaseFirestore, PromptService])
void main() {
  test("Create a new game", () {
      final instance = MockFirebaseFirestore();
      
  });
}