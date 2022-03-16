import 'package:flutter/material.dart';
import 'package:the_movie/models/movie.dart';

class BannerDetail extends StatelessWidget {
  BannerDetail({required this.movie, required this.size});
  Movie movie;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.network(
              movie.posterContentDetailUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: size.height / 3.5,
            ),
            Container(
              height: size.height / 3.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(10, 32, 74, 1),
                    Color.fromRGBO(10, 32, 74, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Image.network(
            movie.posterDetailUrl,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            height: size.height / 5.5,
          ),
        ),
      ],
    );
  }
}
