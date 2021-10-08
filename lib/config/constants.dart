import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/colors.dart';

const textInputDecoration = InputDecoration(
  fillColor: ColorPallete.White,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorPallete.White,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorPallete.Pink,
      width: 2.0,
    ),
  ),
);
