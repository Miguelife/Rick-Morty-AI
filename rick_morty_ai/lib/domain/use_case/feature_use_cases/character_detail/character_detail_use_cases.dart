import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/domain/use_case/character/get_character_by_id_use_case.dart';

@Injectable()
class CharacterDetailUseCases {
  final GetCharacterByIdUseCase getCharacterById;

  const CharacterDetailUseCases({
    required this.getCharacterById,
  });
}
