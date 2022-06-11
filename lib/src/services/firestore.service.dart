
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;


  DocumentReference getDocumentReference(String collectionName, String id) {
    return db.collection(collectionName).doc(id);
  }

  Future<DocumentSnapshot> getDocumentSnapshot(String collectionName, String id) {
    return getDocumentReference(collectionName, id).get();
  }
}