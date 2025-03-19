import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/data/source/character/dto/character_dto.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';

@injectable
class CharacterMapper {
  Character toEntity(CharacterDTO dto) {
    return Character(
      id: dto.id,
      name: dto.name,
      status: dto.status,
      species: dto.species,
      type: dto.type,
      gender: dto.gender,
      origin: _toLocationEntity(dto.origin),
      location: _toLocationEntity(dto.location),
      image: dto.image,
      episode: dto.episode,
      url: dto.url,
      created: dto.created,
    );
  }

  Location _toLocationEntity(LocationDTO dto) {
    return Location(
      name: dto.name,
      url: dto.url,
    );
  }
}
