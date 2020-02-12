import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference

  static Firestore firestore = Firestore.instance;

  final Query topicsCollection =
      firestore.collection("topics").orderBy("topicHeader");

  Stream<QuerySnapshot> get getAllTopics {
    return topicsCollection.snapshots();
  }
}
