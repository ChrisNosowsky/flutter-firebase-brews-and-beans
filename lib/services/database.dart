import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_brew/models/brew.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference theBrewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await theBrewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  // get brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0' 
        );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return theBrewCollection.snapshots().map(_brewListFromSnapshot);
  }

}