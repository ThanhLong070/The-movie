import 'dart:convert';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.date,
    required this.percent,
    required this.posterContentPath,
  });

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '0',
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      date: map['date'] ?? '',
      percent: map['percent'] ?? '0',
      posterContentPath: map['posterContentPath'] ?? '',
    );
  }

  String date;
  String percent;
  String posterPath;
  String title;
  String id;
  String posterContentPath;

  String get posterHomeUrl =>
      'https://www.themoviedb.org/t/p/w440_and_h660_face$posterPath';
  String get posterDetailUrl =>
      'https://www.themoviedb.org/t/p/w220_and_h330_face$posterPath';
  String get posterContentDetailUrl =>
      'https://www.themoviedb.org/t/p/w1000_and_h450_multi_faces$posterContentPath';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'date': date,
      'percent': percent,
      'posterContentPath': posterContentPath,
    };
  }

  String toJson() => json.encode(toMap());
}
