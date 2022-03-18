import 'package:flutter/material.dart';
import 'package:the_movie/models/movie.dart';

class BannerDetail extends StatelessWidget {
  BannerDetail({this.movie, required this.size});
  Movie? movie;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.network(
              movie!.backdropUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: size.height / 3.5,
            ),
            Container(
              height: size.height / 3.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(32, 32, 32, 1),
                    Color.fromRGBO(32, 32, 32, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Image.network(
            movie!.posterDetailUrl,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            height: size.height / 5.5,
          ),
        ),
      ],
    );
  }
}
