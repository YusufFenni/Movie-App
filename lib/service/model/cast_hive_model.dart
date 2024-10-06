import 'package:hive/hive.dart';

part 'cast_hive_model.g.dart'; // Hive için gerekli adapter dosyası

@HiveType(typeId: 1) // Farklı bir typeId atadığınızdan emin olun
class CastHive {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String character;

  @HiveField(2)
  final String profilePath;

  CastHive({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory CastHive.fromJson(Map<String, dynamic> json) {
    return CastHive(
      name: json['name'] ?? 'Unknown',
      character: json['character'] ?? 'Unknown',
      profilePath: json['profile_path'] ?? '',
    );
  }
}
