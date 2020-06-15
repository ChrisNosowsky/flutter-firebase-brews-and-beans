import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference theBrewCollection = Firestore.instance.collection('brews');
}