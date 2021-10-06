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
  final _formKey = GlobalKey<FormState>();

  //textfield state
  String email = "";
  String password = "";
  String error = "";

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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
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
                  validator: (value) => value.length < 6
                      ? 'Password contains 6+ characters'
                      : null,
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
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.signInEmailPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Could not signIn with this Credentitals";
                        });
                      }
                    }
                  },
                  child: Text(
                    "SignIn",
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
