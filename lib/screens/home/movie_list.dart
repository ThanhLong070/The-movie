import 'package:flutter/material.dart';
import 'package:the_movie/models/movie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_movie/screens/detail/main.dart';

class MovieList extends StatelessWidget {
  Movie movie;
  MovieList({required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width * 0.390,
          height: size.height * 0.399,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Poster(movie: movie),
                  ThreeDot(),
                  UserScore(movie: movie),
                ],
              ),
              const SizedBox(height: 10.0),
              Description(movie: movie),
            ],
          ),
        ),
        const SizedBox(width: 21.0),
      ],
    );
  }
}

class Poster extends StatelessWidget {
  Poster({required this.movie});
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(movie: movie),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          movie.posterHomeUrl,
        ),
      ),
    );
  }
}

class ThreeDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 12.0, top: 13.0),
      child: Align(
        alignment: Alignment.topRight,
        child: ImageIcon(
          AssetImage('assets/glyphicons.png'),
          color: Colors.white70,
        ),
      ),
    );
  }
}

class UserScore extends StatelessWidget {
  UserScore({required this.movie});
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 223.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircularPercentIndicator(
                radius: 20.0,
                lineWidth: 2.5,
                percent: double.parse('0.${movie.percent}'),
                progressColor: Colors.greenAccent[700],
                backgroundColor: const Color.fromRGBO(0, 200, 83, 0.3),
                fillColor: Colors.black87,
                circularStrokeCap: CircularStrokeCap.round,
                center: Stack(
                  children: <Widget>[
                    Text(
                      movie.percent,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 17.0, top: 4.5),
                      child: Text(
                        '%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 5.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  Description({required this.movie});
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 130.0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(movie: movie),
                ),
              );
            },
            child: Text(
              movie.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 130.0,
          child: Text(
            movie.date,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
