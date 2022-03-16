import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
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

    List<Movie> _popularMovies = [
      Movie(
        id: '1',
        title: 'Bóng Ma Anh Quốc',
        posterPath: '/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
        date: 'Sep 12, 2013',
        percent: '86',
        posterContentPath: '/hI5h8o3bbZlZwnySEs6rL7pXH32.jpg',
      ),
      Movie(
        id: '2',
        title: 'Xác Sống',
        posterPath: '/rqeYMLryjcawh2JeRpCVUDXYM5b.jpg',
        date: 'Oct 31, 2010',
        percent: '81',
        posterContentPath: '/wvdWb5kTQipdMDqCclC6Y3zr4j3.jpg',
      ),
      Movie(
        id: '3',
        title: 'The Simpsons',
        posterPath: '/k5UALlcA0EnviaCUn2wMjOWYiOO.jpg',
        date: 'Dec 17, 1989',
        percent: '79',
        posterContentPath: '/hpU2cHC9tk90hswCFEpf5AtbqoL.jpg',
      ),
    ];

    List<Movie> _trendingMovies = [
      Movie(
        id: '4',
        title: 'Người Nhện: Không Còn Nhà',
        posterPath: '/y4SQ2dJ1y2LBUnxTH7hCe8sr29c.jpg',
        date: 'Dec 15, 2021',
        percent: '83',
        posterContentPath: '/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg',
      ),
      Movie(
        id: '5',
        title: 'Gấu Đỏ Biến Hình',
        posterPath: '/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
        date: 'Mar 10, 2022',
        percent: '74',
        posterContentPath: '/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg',
      ),
      Movie(
        id: '6',
        title: 'Dự Án Adam',
        posterPath: '/wFjboE0aFZNbVOF05fzrka9Fqyx.jpg',
        date: 'Mar 11, 2022',
        percent: '71',
        posterContentPath: '/ewUqXnwiRLhgmGhuksOdLgh49Ch.jpg',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      body: FooterView(
        children: <Widget>[
          Column(
            children: <Widget>[
              const BannerHome(),
              TitleMoreButton(title: "What's Popular", textButton: 'On TV'),
              Movies(movies: _popularMovies),
              const TrailerHome(),
              TitleMoreButton(title: 'Trending', textButton: 'Today'),
              Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Image.asset('assets/trending_bg.png'),
                ),
                Movies(movies: _trendingMovies)
              ]),
            ],
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
  Movies({required this.movies});
  List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 30.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: movies.map((movie) => MovieList(movie: movie)).toList(),
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
