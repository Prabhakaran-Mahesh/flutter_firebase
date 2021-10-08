import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/config/constants.dart';
import 'package:flutter_firebase/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //textfield state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.BrownLight,
      appBar: AppBar(
        backgroundColor: ColorPallete.AppbarBrown,
        elevation: 0.0,
        title: Text('Register to the App'),
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
              "SignIn",
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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (value) => value.isEmpty ? 'Enter an Email' : null,
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
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                  obscureText: true,
                  validator: (value) => value.length < 6
                      ? 'Password contains 6+ characters'
                      : null,
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
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.registerEmailPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'error';
                        });
                      }
                    }
                  },
                  child: Text(
                    "Register",
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(error),
              ],
            ),
          )),
    );
  }
}
