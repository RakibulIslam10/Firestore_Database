import 'package:cloud_firestore/cloud_firestore.dart';
Future<void> setDataFromFireStore() async {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final name = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
  };
  _firebaseFirestore.collection("Names").doc("1").set(name)
      .onError((e, _) => print("Error writing document: $e"));
}