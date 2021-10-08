import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/shawarma.dart';

class ShawarmaTile extends StatelessWidget {
  final Shawarma shawarma;

  const ShawarmaTile({Key key, this.shawarma}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[shawarma.strength],
          ),
          title: Text(shawarma.name),
          subtitle: Text(shawarma.strength.toString()),
        ),
      ),
    );
  }
}
