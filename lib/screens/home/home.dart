import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.VeryLightBrown,
      appBar: AppBar(
        title: Text("The firebase App"),
        backgroundColor: ColorPallete.AppbarBrown,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: ColorPallete.Black,
            ),
            label: Text(
              "SignOut",
              style: TextStyle(color: ColorPallete.Black),
            ),
          ),
        ],
      ),
    );
  }
}
