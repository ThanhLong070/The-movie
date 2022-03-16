import 'dart:convert';

class Cast {
  Cast({
    required this.id,
    required this.avatarPath,
    required this.nameActor,
    required this.inCharacter,
    required this.episodes,
  });

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source));

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      id: map['id'] ?? '0',
      nameActor: map['nameActor'] ?? '',
      avatarPath: map['poster_path'] ?? '',
      inCharacter: map['inCharacter'] ?? '',
      episodes: map['episodes'] ?? '0',
    );
  }

  String inCharacter;
  String episodes;
  String avatarPath;
  String nameActor;
  String id;

  String get avatarUrl =>
      'https://www.themoviedb.org/t/p/w240_and_h266_face$avatarPath';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameActor': nameActor,
      'poster_path': avatarPath,
      'inCharacter': inCharacter,
      'episodes': episodes,
    };
  }

  String toJson() => json.encode(toMap());
}
