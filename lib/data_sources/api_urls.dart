import 'package:the_movie/shared/constants.dart';

class ApiUrls {
  final Uri API_POPULAR_MOVIES =
      Uri.parse(endpoint + 'movie/popular' + apiKey + '&language=vi-VN&page=1');
  final Uri API_TRENDING_MOVIES = Uri.parse(
      endpoint + 'trending/all/week' + apiKey + '&language=vi-VN&page=1');
  final Uri REQUEST_TOKEN =
      Uri.parse(endpoint + 'authentication/token/new' + apiKey);
  final Uri VALIDATE_WITH_LOGIN =
      Uri.parse(endpoint + 'authentication/token/validate_with_login' + apiKey);
  final Uri SESSION =
      Uri.parse(endpoint + 'authentication/session/new' + apiKey);

  Uri API_CAST(String movieId) {
    return Uri.parse('$endpoint/movie/$movieId/credits$apiKey&language=vi-VN');
  }
}
