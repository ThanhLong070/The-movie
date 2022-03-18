class Movie {
  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.firstAirDate,
      this.title,
      this.name,
      this.mediaType,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    firstAirDate = json['first_air_date'];
    title = json['title'];
    name = json['name'];
    mediaType = json['media_type'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? firstAirDate;
  String? title;
  String? name;
  String? mediaType;
  bool? video;
  num? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['first_air_date'] = firstAirDate;
    data['title'] = title;
    data['name'] = name;
    data['media_type'] = mediaType;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  String get posterHomeUrl =>
      'https://www.themoviedb.org/t/p/w440_and_h660_face$posterPath';

  String get posterDetailUrl =>
      'https://www.themoviedb.org/t/p/w220_and_h330_face$posterPath';

  String get backdropUrl =>
      'https://www.themoviedb.org/t/p/w1000_and_h450_multi_faces$backdropPath';

  double get percent => voteAverage! * 10 / 100;
  String get percentText => (voteAverage! * 1000 ~/ 100).toString();
}
