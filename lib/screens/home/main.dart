import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:the_movie/data_sources/api_services.dart';
import 'package:the_movie/models/movie.dart';
import 'package:the_movie/shared/gradient_button.dart';

import 'nav_bar.dart';
import 'banner.dart';
import 'movie_list.dart';
import 'trailer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: FooterView(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const BannerHome(),
                TitleMoreButton(
                    title: "What's Popular", textButton: 'In Theaters'),
                Movies(isPopular: true, isTrending: false),
                const TrailerHome(),
                TitleMoreButton(title: 'Trending', textButton: 'This Week'),
                Stack(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Image.asset('assets/trending_bg.png'),
                  ),
                  Movies(isPopular: false, isTrending: true)
                ]),
              ],
            ),
          ),
        ],
        footer: Footer(
          alignment: Alignment.centerLeft,
          backgroundColor: const Color.fromARGB(255, 2, 40, 69),
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FooterButton(),
              FooterContent(),
            ],
          ),
          // padding: const EdgeInsets.all(5.0),
        ),
        flex: 10,
      ),
    );
  }
}

class Movies extends StatelessWidget {
  Movies({required this.isPopular, required this.isTrending});
  bool isPopular;
  bool isTrending;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.48,
        child: FutureBuilder<List<Movie>>(
          future: (isPopular && !isTrending)
              ? ApiServices().fetchMoviesData('POPULAR')
              : ApiServices().fetchMoviesData('TRENDING'),
          builder: (context, snapshot) {
            if ((!snapshot.hasData) || (snapshot.hasError)) {
              return Center(
                child: Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(
                        radius: 20.0,
                        color: Color.fromARGB(255, 1, 180, 228),
                      ),
              );
            }
            List<Movie> movieList = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieList(
                  movie: movieList[index],
                  size: size,
                  isPopular: isPopular,
                  isTrending: isTrending,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TitleMoreButton extends StatelessWidget {
  TitleMoreButton({required this.title, required this.textButton});
  String title;
  String textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 35.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 30.0),
          GradientButton(textButton: textButton),
        ],
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}

class FooterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
