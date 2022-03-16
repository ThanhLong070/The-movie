import 'package:flutter/material.dart';
import 'package:the_movie/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String username = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          RichText(
            textAlign: TextAlign.start,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
                ),
                TextSpan(
                  text: ' Click here',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 180, 228),
                  ),
                ),
                TextSpan(
                  text: ' to get started.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      "If you signed up but didn't get your verification email,",
                ),
                TextSpan(
                  text: ' click here',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 180, 228),
                  ),
                ),
                TextSpan(
                  text: ' to have it resent.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Form(
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
          ),
        ],
      ),
    );
  }
}
