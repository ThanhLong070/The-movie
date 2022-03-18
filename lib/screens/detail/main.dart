import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_movie/data_sources/api_services.dart';
import 'package:the_movie/models/cast.dart';
import 'package:the_movie/models/movie.dart';
import 'package:the_movie/screens/detail/banner.dart';
import 'package:the_movie/screens/detail/cast_list.dart';

class Detail extends StatelessWidget {
  Movie movie;
  bool isPopular;
  bool isTrending;
  Detail({
    required this.movie,
    required this.isPopular,
    required this.isTrending,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 32, 32, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BannerDetail(movie: movie, size: size),
                SizedBox(height: size.height / 40),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Title(
                      movie: movie,
                      isPopular: isPopular,
                      isTrending: isTrending,
                    ),
                    SizedBox(height: size.height / 40),
                    UserScore(movie: movie),
                    SizedBox(height: size.height / 40),
                    Genre(movie: movie, size: size),
                    Overview(movie: movie, size: size),
                    SeriesCast(id: movie.id!, size: size),
                  ],
                ),
                // const SizedBox(height: 500),
              ],
            ),
          ),
        ));
  }
}

class Title extends StatelessWidget {
  Title({
    required this.movie,
    required this.isPopular,
    required this.isTrending,
  });
  Movie movie;
  bool isPopular;
  bool isTrending;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: (isPopular && !isTrending)
                  ? '${movie.title}'
                  : movie.mediaType == 'movie' && movie.mediaType != 'tv'
                      ? '${movie.title}'
                      : '${movie.name}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: (isPopular && !isTrending)
                  ? ' (${movie.releaseDate!.substring(0, 4)})'
                  : movie.mediaType == 'movie' && movie.mediaType != 'tv'
                      ? ' (${movie.releaseDate!.substring(0, 4)})'
                      : ' (${movie.firstAirDate!.substring(0, 4)})',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircularPercentIndicator(
                radius: 25.0,
                lineWidth: 4.0,
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 5.5),
                      child: Text(
                        '%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 6.5,
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
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'User Score',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

class Genre extends StatelessWidget {
  Genre({required this.movie, required this.size});
  Movie movie;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 13,
      width: size.width,
      color: const Color.fromRGBO(0, 0, 0, 0.1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 4.0,
                    ),
                    child: Text(
                      '18',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width / 50),
                const Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                  size: 7,
                ),
                SizedBox(width: size.width / 50),
                const Text(
                  '1h',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const Text(
              'Phim Chính Kịch, Phim Hình Sự',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Overview extends StatelessWidget {
  Overview({required this.movie, required this.size});
  Movie movie;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(
                "London's for the taking",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: size.height / 30),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Overview',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 21.0,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${movie.overview}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Steven Knight',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const Text(
            'Creator',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SeriesCast extends StatelessWidget {
  SeriesCast({required this.id, required this.size});
  int id;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 25.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Series Cast',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19.0,
              ),
            ),
            const SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.32,
                    child: FutureBuilder<List<Cast>>(
                      future: ApiServices().fetchCast(id.toString()),
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
                        List<Cast> castList = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: castList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CastList(cast: castList[index], size: size);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
