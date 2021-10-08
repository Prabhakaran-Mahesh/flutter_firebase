import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/shawarma.dart';
import 'package:flutter_firebase/screens/home/widgets/shawarmaTile.dart';
import 'package:provider/provider.dart';

class ShawarmaList extends StatefulWidget {
  const ShawarmaList({Key key}) : super(key: key);

  @override
  _ShawarmaListState createState() => _ShawarmaListState();
}

class _ShawarmaListState extends State<ShawarmaList> {
  @override
  Widget build(BuildContext context) {
    final shawarma = Provider.of<List<Shawarma>>(context);

    return ListView.builder(
      itemCount: shawarma.length,
      itemBuilder: (context, index) {
        return ShawarmaTile(shawarma: shawarma[index]);
      },
    );
  }
}
