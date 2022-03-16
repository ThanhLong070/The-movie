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
        Card(
          child: SizedBox(
            width: size.width * 0.231,
            height: size.height * 0.122,
            child: Column(
              children: <Widget>[
                Image.network(cast.avatarUrl),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.green.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "d".toUpperCase(),
                                style: Theme.of(context).textTheme.button),
                            TextSpan(
                              text: "d".toUpperCase(),
                              style: TextStyle(
                                color: Colors.green.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'dd',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20.0),
      ],
    );
  }
}
