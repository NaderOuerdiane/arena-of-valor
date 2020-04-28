import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  initial() async {
    usersCollection.document(uid).setData({'input': 0});
  }

  Future insertData(
    int input,
    double winLoss,
    double kill,
    double death,
    double assist,
    double gold,
    double rating,
    double demageTaken,
    double demageDealt,
    double teamPart,
  ) async {
    try {
      await usersCollection
          .document(uid)
          .collection('$uid')
          .document('$input')
          .setData({
        'input': input,
        'winLoss': winLoss,
        'kill': kill,
        'death': death,
        'assist': assist,
        'gold': gold,
        'rating': rating,
        'demageTaken': demageTaken,
        'demageDealt': demageDealt,
        'teamPart': teamPart,
      });
      await usersCollection.document(uid).setData({
        'input': input,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<DocumentSnapshot> getInput() async {
    var result = await usersCollection.document(uid).get();
    return result;
  }

  Future<QuerySnapshot> getData() async {
    var result =
        await usersCollection.document(uid).collection(uid).getDocuments();
    return result;
  }
}
