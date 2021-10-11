import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';
import 'package:flutter_firebase/config/constants.dart';
import 'package:flutter_firebase/config/images.dart';
import 'package:flutter_firebase/config/loading.dart';
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
            backgroundColor: ColorPallete.Black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: ColorPallete.Black,
              elevation: 0.0,
              title: Text('Register!'),
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
                    "SignIn",
                    style: TextStyle(
                      color: ColorPallete.White,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
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
                            style: ElevatedButton.styleFrom(
                              primary: ColorPallete.White,
                              minimumSize: Size(200, 40),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth
                                    .registerEmailPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'error';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Register",
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
