import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:steve_beaudoin/models/topics.dart';

class DatabaseService {
  //collection referen
  static Firestore firestore = Firestore.instance;

  final Query topicsCollection = firestore.collection("topics");

  List<TopicHeader> _getTopicsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((topic) {
      Map<String, dynamic> json = topic.data;

      TopicHeader.fromJson(json["topicHeader"]);
    }).toList();
  }

  Stream<List<TopicHeader>> get getAllTopics {
    return topicsCollection.snapshots().map(_getTopicsFromSnapshot);
  }
}
