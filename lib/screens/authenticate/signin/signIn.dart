import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //textfield state
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.brownLight,
      appBar: AppBar(
        backgroundColor: ColorPallete.AppbarBrown,
        elevation: 0.0,
        title: Text('Sign In to the App'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: ColorPallete.Black,
            ),
            label: Text(
              "Register",
              style: TextStyle(
                color: ColorPallete.Black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  child: Text(
                    "SignIn",
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
