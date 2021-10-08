import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
}
