import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/models/shawarma.dart';
import 'package:flutter_firebase/screens/home/widgets/bottomForm.dart';
import 'package:flutter_firebase/screens/home/widgets/shawarmaList.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _settingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 60.0,
              ),
              child: BottomForm(),
            );
          });
    }

    return StreamProvider<List<Shawarma>>.value(
      value: DatabaseService().shawarma,
      child: Scaffold(
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
            TextButton.icon(
              onPressed: () => _settingsPanel(),
              icon: Icon(
                Icons.settings,
                color: ColorPallete.Black,
              ),
              label: Text(
                "Settings",
                style: TextStyle(color: ColorPallete.Black),
              ),
            ),
            SizedBox(width: 5.0),
            SizedBox(width: 5.0),
          ],
        ),
        body: ShawarmaList(),
      ),
    );
  }
}
