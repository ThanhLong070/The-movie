import 'package:flutter/material.dart';

class ContentSignIn extends StatelessWidget {
  const ContentSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
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
              color: Colors.white,
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
      ],
    );
  }
}
