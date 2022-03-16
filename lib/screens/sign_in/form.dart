import 'package:flutter/material.dart';
import 'package:the_movie/shared/constants.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({Key? key}) : super(key: key);

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  // text field state
  String username = '';
  String password = '';
  String error = '';

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
            ),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            decoration: textInputDecoration,
            cursorColor: Colors.grey[600],
            cursorWidth: 1.5,
            validator: (val) => val!.isEmpty ? 'Enter an username' : null,
            onChanged: (val) => setState(() => username = val),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            decoration: textInputDecoration,
            cursorColor: Colors.grey[600],
            cursorWidth: 1.5,
            obscureText: true,
            validator: (val) =>
                val!.length < 6 ? 'Enter a password 6+ chars long' : null,
            onChanged: (val) => setState(() => password = val),
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
                      onPressed: () {},
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
