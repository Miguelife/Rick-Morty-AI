import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/domain/use_case/character/get_characters_use_case.dart';

@Injectable()
class CharacterListUseCases {
  final GetCharactersUseCase getCharacters;

  const CharacterListUseCases({required this.getCharacters});
}
