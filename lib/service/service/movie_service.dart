import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/service/model/cast_model.dart';
import 'package:movieapp/service/model/movie_model.dart';

class MovieService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = dotenv.env['TMDB_API_KEY']!;
  final Dio _dio = Dio();

  Future<List<Movie>> fetchMovies(String category) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/$category',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'page': 1,
        },
      );
 
      if (response.statusCode == 200) {
        final data = response.data;
        final List movies = data['results'] as List;
        return Future.wait(movies.map((movieJson) async {
          final movieId = movieJson['id'];
          final castList =
              await fetchMovieCast(movieId);
          return Movie.fromJson(
              movieJson, castList);
        }).toList());
      } else {
        throw Exception(
            'Failed to load movies. Status Code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('Error: ${e.response?.statusCode}, Message: ${e.message}');
      throw Exception('Failed to load movies');
    }
  }

  // Sorguya göre film arama
  Future<List<Movie>> fetchMoviesByQuery(String query) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/search/movie',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'query': query,
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List movies = data['results'] as List;

       
        return Future.wait(movies.map((movieJson) async {
          final movieId = movieJson['id'];
          final castList =
              await fetchMovieCast(movieId); 
          return Movie.fromJson(
              movieJson, castList); 
        }).toList());
      } else {
        throw Exception(
            'Failed to load movies. Status Code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('Error: ${e.response?.statusCode}, Message: ${e.message}');
      throw Exception('Failed to load movies');
    }
  }

  // Oyuncuları getir
  Future<List<Cast>> fetchMovieCast(int movieId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/$movieId/credits',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List castData = data['cast'] as List;

        // Cast listesini oluştur
        return castData.map((castJson) => Cast.fromJson(castJson)).toList();
      } else {
        throw Exception(
            'Failed to load cast information. Status Code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('Error: ${e.response?.statusCode}, Message: ${e.message}');
      throw Exception('Failed to load cast information');
    }
  }
}
