import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/shawarma.dart';
import 'package:flutter_firebase/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference shawarmaCollection =
      FirebaseFirestore.instance.collection('shawarma');

  Future updateUserData(String shawarma, String name, int strength) async {
    return await shawarmaCollection.doc(uid).set({
      'shawarma': shawarma,
      'name': name,
      'strength': strength,
    });
  }

  //shawarma list
  List<Shawarma> _shawarmaListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      return Shawarma(
        name: doc['name'] ?? '',
        shawarma: doc['shawarma'] ?? '0',
        strength: doc['strength'] ?? 100,
      );
    }).toList();
  }

  // get streams
  Stream<List<Shawarma>> get shawarma {
    return shawarmaCollection.snapshots().map(_shawarmaListFromSnapshot);
  }

  //Userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot['name'],
        mayo: snapshot['shawarma'],
        strength: snapshot['strength']);
  }

  //get user doc Stream
  Stream<UserData> get userData {
    return shawarmaCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
