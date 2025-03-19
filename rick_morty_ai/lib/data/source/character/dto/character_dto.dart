class CharacterDTO {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationDTO origin;
  final LocationDTO location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterDTO({
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

  factory CharacterDTO.fromJson(Map<String, dynamic> json) {
    return CharacterDTO(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationDTO.fromJson(json['origin']),
      location: LocationDTO.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }
}

class LocationDTO {
  final String name;
  final String url;

  LocationDTO({
    required this.name,
    required this.url,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) {
    return LocationDTO(
      name: json['name'],
      url: json['url'],
    );
  }
}
