import 'package:rick_morty_ai/domain/entity/character/character.dart';

abstract interface class CharacterRepositoryInterface {
  Future<List<Character>> getCharacters();
  Future<Character> getCharacterById(int id);
}
