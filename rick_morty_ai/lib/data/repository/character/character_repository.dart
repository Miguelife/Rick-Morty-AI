import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/core/exceptions/app_exception_handler.dart';
import 'package:rick_morty_ai/data/repository/character/mapper/character_mapper.dart';
import 'package:rick_morty_ai/data/source/character/character_data_source_interface.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/domain/repository/character/character_repository_interface.dart';

@Injectable(as: CharacterRepositoryInterface)
class CharacterRepository implements CharacterRepositoryInterface {
  final CharacterDataSourceInterface _dataSource;
  final CharacterMapper _mapper;
  final AppExceptionHandler _exceptionHandler;

  const CharacterRepository({
    required CharacterDataSourceInterface dataSource,
    required CharacterMapper mapper,
    required AppExceptionHandler exceptionHandler,
  })  : _dataSource = dataSource,
        _mapper = mapper,
        _exceptionHandler = exceptionHandler;

  @override
  Future<List<Character>> getCharacters() async {
    try {
      final dtos = await _dataSource.getCharacters();
      return dtos.map((dto) => _mapper.toEntity(dto)).toList();
    } catch (exception) {
      throw _exceptionHandler.handle(exception);
    }
  }

  @override
  Future<Character> getCharacterById(int id) async {
    try {
      final dto = await _dataSource.getCharacterById(id);
      return _mapper.toEntity(dto);
    } catch (exception) {
      throw _exceptionHandler.handle(exception);
    }
  }
}
