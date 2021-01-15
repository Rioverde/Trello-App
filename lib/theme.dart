import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationhandler() {
  return InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal),
      borderRadius: BorderRadius.circular(30.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    hintStyle: TextStyle(
      fontFamily: 'Ubuntu',
      color: Colors.grey.shade400,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Ubuntu',
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red, //this has no effect
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
}
