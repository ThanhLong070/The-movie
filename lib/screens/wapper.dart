import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:the_movie/screens/home.dart';
import 'package:the_movie/screens/sign_in.dart';
import 'package:the_movie/shared/nav_bar.dart';

class Wrapper extends StatelessWidget {
  bool? isSigIn = false;
  // bool? isDetail = false;
  // Movie? movie;
  Widget widgetUI = Home();

  Wrapper({
    this.isSigIn,
    // this.isDetail,
    // this.movie,
  });

  @override
  Widget build(BuildContext context) {
    widgetUI = isSigIn ?? false ? SignIn() : Home();
    // : (isDetail ?? true ? Detail(movie: movie) : Home());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: FooterView(
        children: <Widget>[widgetUI],
        footer: Footer(
          alignment: Alignment.centerLeft,
          backgroundColor: const Color.fromARGB(255, 2, 40, 69),
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        primary: const Color.fromARGB(255, 35, 94, 167),
                        textStyle: const TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('JOIN THE COMMUNITY'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              const Text(
                'THE BASICS',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Giới thiệu về TMDB',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Support Forums',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'API',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'System Status',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'GET INVOLVED',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Contribution Bible',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Add New Movie',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Add New TV Show',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'COMMUNITY',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Guidelines',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Discussions',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Leaderboard',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Twitter',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'LEGAL',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Terms of Use',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'API Terms of Use',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Build 131fabf (3476)',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white12,
                  ),
                ),
              ),
            ],
          ),
          // padding: const EdgeInsets.all(5.0),
        ),
        flex: 10,
      ),
    );
    // return const Authenticate();
    // return either Home or Authenticate widget
    // if (user == null) {
    //   return Authenticate();
    // } else {
    // return const Home();
    // }
    // }
  }
}
