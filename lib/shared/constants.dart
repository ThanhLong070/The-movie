import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1)),
);
