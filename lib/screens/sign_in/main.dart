import 'package:flutter/material.dart';
import 'package:the_movie/screens/sign_in/content.dart';
import 'package:the_movie/screens/sign_in/form.dart';
import 'package:the_movie/shared/constants.dart';

import 'title.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            TitleSignIn(),
            SizedBox(height: 10.0),
            ContentSignIn(),
            SizedBox(height: 40.0),
            FormSignIn(),
          ],
        ),
      ),
    );
  }
}
