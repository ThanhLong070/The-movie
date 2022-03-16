import 'package:flutter/material.dart';

class TitleSignIn extends StatelessWidget {
  const TitleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login to your account',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
