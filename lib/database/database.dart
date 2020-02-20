import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:steve_beaudoin/models/locations.dart';
import 'package:steve_beaudoin/models/topics.dart';

class DatabaseService {
  //collection referen
  static Firestore firestore = Firestore.instance;

  final Query topicsCollection = firestore.collection("topics");
  final Query locationCollection = firestore.collection("locations");

  List<TopicHeader> _getTopicsFromSnapshot(QuerySnapshot snapshot) {
    // final data = snapshot.documents.map((topic) {
    //   print(topic);
    //   TopicHeader.fromJson(topic.data["topicHeader"]);
    // }).toList();

    final data = snapshot.documents
        .map((x) => TopicHeader.fromJson(x.data["topicHeader"]))
        .toList();

    print(data);
    return data;
  }

  List<LocationInfo> _getLocationFromSnapshot(QuerySnapshot snapshot) {
    final data = snapshot.documents
        .map((x) => LocationInfo.fromJson(
              x.data,
            ))
        .toList();

    print(data);
    return data;
  }

  Stream<List<TopicHeader>> get getAllTopics {
    return topicsCollection.snapshots().map(_getTopicsFromSnapshot);
  }

  Stream<List<LocationInfo>> get getAllLocations {
    return locationCollection.snapshots().map(_getLocationFromSnapshot);
  }
}
