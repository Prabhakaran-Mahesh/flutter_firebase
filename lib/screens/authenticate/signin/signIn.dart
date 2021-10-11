import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/config/constants.dart';
import 'package:flutter_firebase/config/images.dart';
import 'package:flutter_firebase/config/loading.dart';
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
  bool loading = false;

  //textfield state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorPallete.Black,
            appBar: AppBar(
              backgroundColor: ColorPallete.Black,
              elevation: 0.0,
              title: Text('SignIn!'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: ColorPallete.White,
                  ),
                  label: Text(
                    "Register",
                    style: TextStyle(
                      color: ColorPallete.White,
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Gallery.BgImage),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 50.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: "Email"),
                            validator: (value) =>
                                value.isEmpty ? 'Enter an Email' : null,
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
                            decoration: textInputDecoration.copyWith(
                                hintText: "Password"),
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
                            style: ElevatedButton.styleFrom(
                              primary: ColorPallete.White,
                              minimumSize: Size(200, 40),
                            ),
                            onPressed: () async {
                              print(email);
                              print(password);
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth
                                    .signInEmailPassword(email, password);

                                if (result == null) {
                                  setState(() {
                                    error =
                                        "Could not signIn with this Credentitals";
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              "SignIn",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(error),
                        ],
                      ),
                    ),
                  ],
                )),
          );
  }
}
