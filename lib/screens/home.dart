import 'package:flutter/material.dart';
import 'package:the_movie/models/movie.dart';
import 'package:the_movie/shared/gradient_button.dart';
import 'package:the_movie/shared/movie_list.dart';

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

    String imgBaner =
        'https://www.themoviedb.org/t/p/w880_and_h600_multi_faces_filter(duotone,032541,01b4e4)/oE6bhqqVFyIECtBzqIuvh6JdaB5.jpg';

    return Column(
      children: <Widget>[
        Stack(
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 35.0),
          child: Row(
            children: const <Widget>[
              Text(
                "What's Popular",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 30.0),
              GradientButton(titleButton: 'On TV'),
            ],
          ),
        ),
        Movies(movies: _popularMovies),
        Container(
          width: 390 * 1.07,
          height: 118 * 1.07,
          color: const Color.fromRGBO(3, 37, 65, 0.75),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    const Text(
                      'Latest Trailers',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(192, 254, 207, 1),
                              Color.fromRGBO(30, 213, 169, 1),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                          minWidth: 120.0,
                          minHeight: 40.0,
                        ),
                        child: Row(
                          children: const <Widget>[
                            Text(
                              'On TV',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "This panel didn't return any results. Try",
                        ),
                        TextSpan(
                          text: ' refreshing',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 180, 228),
                          ),
                        ),
                        TextSpan(
                          text: ' it.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 35.0),
          child: Row(
            children: const <Widget>[
              Text(
                "Trending",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              GradientButton(titleButton: 'Today'),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Image.asset('assets/trending_bg.png'),
            ),
            Movies(movies: _trendingMovies),
          ],
        )
      ],
    );
  }
}

class Movies extends StatelessWidget {
  const Movies({required this.movies});
  final List<Movie> movies;

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
