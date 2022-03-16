import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_movie/models/cast.dart';
import 'package:the_movie/models/movie.dart';
import 'package:the_movie/shared/cast_list.dart';

class Detail extends StatelessWidget {
  Movie? movie;
  Detail({this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Cast> _cast = [
      Cast(
        id: '1',
        avatarPath: '/i8dOTC0w6V274ev5iAAvo4Ahhpr.jpg',
        nameActor: 'Cillian Murphy',
        inCharacter: 'Tommy Shelby',
        episodes: '34',
      ),
      Cast(
        id: '2',
        avatarPath: '/i8dOTC0w6V274ev5iAAvo4Ahhpr.jpg',
        nameActor: 'Cillian Murphy',
        inCharacter: 'Tommy Shelby',
        episodes: '34',
      ),
      Cast(
        id: '6',
        avatarPath: '/i8dOTC0w6V274ev5iAAvo4Ahhpr.jpg',
        nameActor: 'Cillian Murphy',
        inCharacter: 'Tommy Shelby',
        episodes: '34',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Container(
            color: const Color.fromARGB(255, 10, 32, 74),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.network(
                          movie!.posterContentDetailUrl,
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
                        movie!.posterDetailUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        height: size.height / 5.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 40),
                Center(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: movie!.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                            const TextSpan(
                              text: ' (2013)',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Row(
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
                                  percent: double.parse('0.${movie!.percent}'),
                                  progressColor: Colors.greenAccent[700],
                                  backgroundColor:
                                      const Color.fromRGBO(0, 200, 83, 0.3),
                                  fillColor: Colors.black87,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Stack(
                                    children: <Widget>[
                                      Text(
                                        movie!.percent,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 5.5),
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
                      ),
                      SizedBox(height: size.height / 40),
                      Container(
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
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.6),
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
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.6),
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
                      ),
                      Container(
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
                            const Text(
                              'Một băng đảng khét tiếng xuất hiện ở Birmingham, Anh Quốc năm 1919. Cầm đầu băng là Tommy Shelby, tên trùm tội phạm khét tiếng muốn nổi lên bằng mọi giá.',
                              style: TextStyle(
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
                      ),
                      Container(
                        height: size.height / 6.2,
                        width: size.width,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(25),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),

                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                'Series Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.0,
                                ),
                              ),
                              // SeriesCast(cast: _cast),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SeriesCast extends StatelessWidget {
  SeriesCast({required this.cast});
  List<Cast> cast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cast.map((cast) => CastList(cast: cast)).toList(),
      ),
    );
  }
}
