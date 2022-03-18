import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/auth/auth_bloc.dart';
import 'package:the_movie/blocs/auth/auth_event.dart';
import 'package:the_movie/shared/constants.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({Key? key}) : super(key: key);

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isUsernameBlank = false;
  bool isPasswordBlank = false;

  AuthBloc? authBloc;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  void onPressLoginButton() async {
    authBloc!.add(LoginButtonPressed(
        username: usernameController.text, password: passwordController.text));
    setState(() {
      usernameController.text.isEmpty
          ? isUsernameBlank = true
          : isUsernameBlank = false;
      passwordController.text.isEmpty
          ? isPasswordBlank = true
          : isPasswordBlank = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            controller: usernameController,
            decoration: textInputDecoration.copyWith(
              errorText: isUsernameBlank ? 'Username Can\'t Be Empty' : null,
              errorStyle: const TextStyle(fontSize: 16.0),
            ),
            cursorColor: Colors.grey[600],
            cursorWidth: 1.5,
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            controller: passwordController,
            decoration: textInputDecoration.copyWith(
              errorText: isPasswordBlank ? 'Password Can\'t Be Empty' : null,
              errorStyle: const TextStyle(fontSize: 16.0),
            ),
            cursorColor: Colors.grey[600],
            cursorWidth: 1.5,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 1, 180, 228),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        primary: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: onPressLoginButton,
                      child: const Text('Đăng nhập'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(35),
                child: Text(
                  'Reset password',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 1, 180, 228),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
