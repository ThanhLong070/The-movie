import 'package:flutter/material.dart';
import 'package:the_movie/models/movie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_movie/screens/detail/main.dart';

class MovieList extends StatelessWidget {
  bool isPopular;
  bool isTrending;
  Movie movie;
  Size size;
  MovieList({
    required this.movie,
    required this.size,
    required this.isPopular,
    required this.isTrending,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 30.0),
      child: SizedBox(
        width: size.width * 0.390,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Poster(
                  movie: movie,
                  isPopular: isPopular,
                  isTrending: isTrending,
                ),
                ThreeDot(),
                UserScore(movie: movie),
              ],
            ),
            const SizedBox(height: 10.0),
            Description(
              movie: movie,
              isPopular: isPopular,
              isTrending: isTrending,
            ),
          ],
        ),
      ),
    );
  }
}

class Poster extends StatelessWidget {
  bool isPopular;
  bool isTrending;
  Movie movie;
  Poster({
    required this.movie,
    required this.isPopular,
    required this.isTrending,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              movie: movie,
              isPopular: isPopular,
              isTrending: isTrending,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(movie.posterHomeUrl),
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
                percent: movie.percent,
                progressColor: Colors.greenAccent[700],
                backgroundColor: const Color.fromRGBO(0, 200, 83, 0.3),
                fillColor: Colors.black87,
                circularStrokeCap: CircularStrokeCap.round,
                center: Stack(
                  children: <Widget>[
                    Text(
                      movie.percentText,
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
  Description({
    required this.movie,
    required this.isPopular,
    required this.isTrending,
  });

  Movie movie;
  bool isPopular;
  bool isTrending;

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
                  builder: (context) => Detail(
                    movie: movie,
                    isPopular: isPopular,
                    isTrending: isTrending,
                  ),
                ),
              );
            },
            child: Text(
              (isPopular && !isTrending)
                  ? '${movie.title}'
                  : movie.mediaType == 'movie' && movie.mediaType != 'tv'
                      ? '${movie.title}'
                      : '${movie.name}',
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
            (isPopular && !isTrending)
                ? '${movie.releaseDate}'
                : movie.mediaType == 'movie' && movie.mediaType != 'tv'
                    ? '${movie.releaseDate}'
                    : '${movie.firstAirDate}',
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
