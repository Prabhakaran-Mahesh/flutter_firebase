import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShawarmaList extends StatefulWidget {
  const ShawarmaList({Key key}) : super(key: key);

  @override
  _ShawarmaListState createState() => _ShawarmaListState();
}

class _ShawarmaListState extends State<ShawarmaList> {
  @override
  Widget build(BuildContext context) {
    final shawarma = Provider.of<QuerySnapshot>(context);
    for (var doc in shawarma.docs) {
      print(doc.data());
    }
    return Container();
  }
}
