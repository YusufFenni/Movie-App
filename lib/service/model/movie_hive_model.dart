import 'package:hive/hive.dart';

import 'cast_model.dart';

part 'movie_hive_model.g.dart'; // Hive için gerekli adapter dosyası

@HiveType(typeId: 0) // typeId benzersiz olmalı
class MovieHive {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final String backdropPath;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final double voteAverage;

  @HiveField(6)
  final String genre;

  @HiveField(7)
  final DateTime releaseDate;

  @HiveField(8)
  final int runtime;

  @HiveField(9)
  final List<Cast>
      castList; // Oyuncu listesi (Cast için de TypeAdapter gerekir)

  MovieHive({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genre,
    required this.releaseDate,
    required this.runtime,
    required this.castList,
  });

  factory MovieHive.fromJson(Map<String, dynamic> json, List<Cast> castList) {
    return MovieHive(
      id: json['id'],
      title: json['title'] ?? 'No Title',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? 'No description',
      voteAverage: (json['vote_average'] as num).toDouble(),
      genre: (json['genre_ids'] as List).isNotEmpty
          ? json['genre_ids'][0].toString()
          : 'Unknown',
      releaseDate: DateTime.parse(json['release_date'] ?? '2000-01-01'),
      runtime: json['runtime'] ?? 0,
      castList: castList,
    );
  }
}
