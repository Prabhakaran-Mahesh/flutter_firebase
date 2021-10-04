import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if signed in return home, else authenticate
    return Home();
  }
}
