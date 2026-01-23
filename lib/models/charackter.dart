class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    species: json['species'] as String,
    type: json['type'] as String,
    gender: json['gender'] as String,
    origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    image: json['image'] as String,
    episode: List<String>.from(
      (json['episode'] as List).map((x) => x as String),
    ),
    url: json['url'] as String,
    created: DateTime.parse(json['created'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': origin.toJson(),
    'location': location.toJson(),
    'image': image,
    'episode': List<dynamic>.from(episode.map((x) => x)),
    'url': url,
    'created': created.toIso8601String(),
  };
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) =>
      Origin(name: json['name'] as String, url: json['url'] as String);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(name: json['name'] as String, url: json['url'] as String);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
