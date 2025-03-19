import 'dto/character_dto.dart';

abstract interface class CharacterDataSourceInterface {
  Future<List<CharacterDTO>> getCharacters();
  Future<CharacterDTO> getCharacterById(int id);
}
