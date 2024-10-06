import 'cast_model.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String genre;
  final DateTime releaseDate;
  final int runtime;
  final List<Cast> castList; // Oyuncu listesi

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genre,
    required this.releaseDate,
    required this.runtime,
    required this.castList, // Oyuncu listesi modeli
  });

  // JSON'dan Movie nesnesini oluşturuyoruz
  factory Movie.fromJson(Map<String, dynamic> json, List<Cast> castList) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? 'No Title',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? 'No description',
      voteAverage: (json['vote_average'] as num).toDouble(),
      genre: (json['genre_ids'] as List).isNotEmpty ? json['genre_ids'][0].toString() : 'Unknown',
      releaseDate: DateTime.parse(json['release_date'] ?? '2000-01-01'),
      runtime: json['runtime'] ?? 0,
      castList: castList, // Gelen castList'i burada set ediyoruz
    );
  }
}
