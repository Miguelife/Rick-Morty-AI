import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/domain/repository/character/character_repository_interface.dart';

@injectable
class GetCharactersUseCase {
  final CharacterRepositoryInterface _repository;

  const GetCharactersUseCase({
    required CharacterRepositoryInterface repository,
  }) : _repository = repository;

  Future<List<Character>> call() async {
    return await _repository.getCharacters();
  }
}
