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

const String endpoint = 'https://api.themoviedb.org/3/';
const String apiKey = '?api_key=7571ca5200c206929fb032d4450a0317';
// const String image_link = 'https://image.tmdb.org/t/p/';
