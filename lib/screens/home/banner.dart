import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgBaner =
        'https://www.themoviedb.org/t/p/w880_and_h600_multi_faces_filter(duotone,032541,01b4e4)/oE6bhqqVFyIECtBzqIuvh6JdaB5.jpg';

    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.network(
              imgBaner,
              fit: BoxFit.cover,
              height: 320,
            ),
            Container(
              height: 320,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(3, 37, 65, 0.8),
                    Color.fromRGBO(3, 37, 65, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome.',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                      ),
                    ),
                    TextSpan(
                      text: '''
                                Millions of movies, TV shows and people to discover. Explore now.''',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26.0,
              ),
              SizedBox(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    suffixIcon: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(30, 213, 169, 1),
                            Color.fromRGBO(1, 180, 228, 1),
                          ],
                        ),
                      ),
                      child: const MaterialButton(
                        onPressed: null,
                        minWidth: 100.0,
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 0),
                    ),
                  ),
                  cursorColor: Colors.black,
                  cursorWidth: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
