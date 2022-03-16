import 'package:flutter/material.dart';
import 'package:the_movie/models/cast.dart';

class CastList extends StatelessWidget {
  Cast cast;
  CastList({required this.cast});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            margin: const EdgeInsets.only(right: 2.0, bottom: 2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: SizedBox(
              width: 120.0,
              child: Column(
                children: <Widget>[
                  Image.network(cast.avatarUrl),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            cast.nameActor,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            cast.inCharacter,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            '${cast.episodes} Episodes',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }
}
