import 'package:http/http.dart' as http;
import 'package:the_movie/models/cast.dart';
import 'package:the_movie/models/movie.dart';
import 'package:the_movie/models/request_token.dart';
import 'dart:convert';
import 'api_urls.dart';

class ApiServices {
  Future<List<Movie>> fetchMoviesData(String name) async {
    try {
      http.Response response = await http.get(name == 'TRENDING'
          ? ApiUrls().API_TRENDING_MOVIES
          : ApiUrls().API_POPULAR_MOVIES);
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        print(response.reasonPhrase);
        throw Exception('Error loaded api movies data');
      } else {
        print('Load api movies data');
        const JsonDecoder decoder = JsonDecoder();
        final moviesListContainer = decoder.convert(jsonBody);
        final List moviesList = moviesListContainer['results'];
        print('name --- $name');
        print('moviesList --- $moviesList');
        return moviesList.map((movie) => Movie.fromJson(movie)).toList();
      }
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Cast>> fetchCast(String id) {
    return http.get(ApiUrls().API_CAST(id)).then((http.Response response) {
      final String jsonBody = response.body;
      int statusCode = response.statusCode;
      if (statusCode != 200) {
        print('Error loaded api cast');
        throw Exception(response.reasonPhrase);
      } else {
        const JsonDecoder decoder = JsonDecoder();
        final castListContainer = decoder.convert(jsonBody);
        final List castList = castListContainer['cast'];
        return castList.map((castDetail) => Cast.fromJson(castDetail)).toList();
      }
    });
  }

  Future<String> getRequestToken() {
    return http.get(ApiUrls().REQUEST_TOKEN).then((http.Response response) {
      final String jsonBody = response.body;
      const JsonDecoder decoder = JsonDecoder();
      final requestTokenContainer = decoder.convert(jsonBody);
      final String requestToken = requestTokenContainer['request_token'];
      print('get token: ' + requestToken);
      return requestToken;
    });
  }

  Future<RequestToken> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response =
        await http.post(ApiUrls().VALIDATE_WITH_LOGIN, body: requestBody);
    print('validate login: ' + response.body);
    return RequestToken.fromJson({'response': response.body});
  }

  Future<Map<String, dynamic>> createSession(
      Map<String, dynamic> requestBody) async {
    final response = await http.post(ApiUrls().SESSION, body: requestBody);
    print('create session: ' + response.body);
    return jsonDecode(response.body);
  }
}
