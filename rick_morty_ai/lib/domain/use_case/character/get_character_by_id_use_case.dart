import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/domain/repository/character/character_repository_interface.dart';

@Injectable()
class GetCharacterByIdUseCase {
  final CharacterRepositoryInterface _repository;

  const GetCharacterByIdUseCase({
    required CharacterRepositoryInterface repository,
  }) : _repository = repository;

  Future<Character> call(int id) async {
    return await _repository.getCharacterById(id);
  }
}
