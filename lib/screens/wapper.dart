import 'package:flutter/material.dart';
import 'package:the_movie/screens/home/main.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
    // return either Home or Authenticate widget
    // if (user == null) {
    //   return Authenticate();
    // } else {
    // return const Home();
    // }
    // }
  }
}
