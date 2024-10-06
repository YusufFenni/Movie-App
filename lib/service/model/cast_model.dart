class Cast {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  Cast({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  // JSON'dan Cast nesnesi oluşturuyoruz
  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      name: json['name'] ?? 'No Name',
      character: json['character'] ?? 'No Character',
      profilePath: json['profile_path'] ?? '',
    );
  }
}
