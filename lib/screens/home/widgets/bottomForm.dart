import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/constants.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/config/loading.dart';

class BottomForm extends StatefulWidget {
  @override
  _BottomFormState createState() => _BottomFormState();
}

class _BottomFormState extends State<BottomForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentMayo;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Update your Info settings',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.name,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Name"),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a Name' : null,
                      onChanged: (value) {
                        setState(() {
                          _currentName = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    //MayoSlider
                    TextFormField(
                      initialValue: userData.mayo,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Mayo"),
                      validator: (value) => value.isEmpty ? 'Enter Mayo' : null,
                      onChanged: (value) {
                        setState(() {
                          print(userData.mayo);
                          _currentMayo = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    //StrengthSlider
                    Slider(
                      activeColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      inactiveColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      onChanged: (value) => setState(
                        () => _currentStrength = value.round(),
                      ),
                      min: 100,
                      max: 900,
                      divisions: 8,
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentMayo ?? userData.mayo,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Update",
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
