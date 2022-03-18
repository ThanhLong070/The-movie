import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/auth/auth_bloc.dart';
import 'package:the_movie/blocs/auth/auth_state.dart';
import 'package:the_movie/screens/sign_in/content.dart';
import 'package:the_movie/screens/sign_in/form.dart';

import 'error_message.dart';
import 'title.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.popAndPushNamed(context, '/home');
          }
        },
        child: Container(
          color: const Color.fromARGB(255, 2, 40, 69),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Image.asset('assets/logo.png', width: 100)),
                const SizedBox(height: 50.0),
                const TitleSignIn(),
                const SizedBox(height: 10.0),
                const ContentSignIn(),
                const SizedBox(height: 40.0),
                const ErrorMessage(),
                const FormSignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
