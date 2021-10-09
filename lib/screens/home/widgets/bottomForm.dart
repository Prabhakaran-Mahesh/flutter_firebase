import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/constants.dart';

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
    return Form(
      key: _formKey,
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
            decoration: textInputDecoration.copyWith(hintText: "Name"),
            validator: (value) => value.isEmpty ? 'Enter a Name' : null,
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
            decoration: textInputDecoration.copyWith(hintText: "Mayo"),
            validator: (value) => value.isEmpty ? 'Enter Mayo' : null,
            onChanged: (value) {
              setState(() {
                _currentMayo = value;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),

          //StrengthSlider
          Slider(
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            value: (_currentStrength ?? 100).toDouble(),
            onChanged: (value) => setState(
              () => _currentStrength = value.round(),
            ),
            min: 100,
            max: 900,
            divisions: 8,
          ),

          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Update",
            ),
          ),
        ],
      ),
    );
  }
}
