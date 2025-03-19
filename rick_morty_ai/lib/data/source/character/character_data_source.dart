import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/core/constants/constants.dart';

import 'character_data_source_interface.dart';
import 'dto/character_dto.dart';

@Injectable(as: CharacterDataSourceInterface)
class CharacterDataSource implements CharacterDataSourceInterface {
  final Dio _dio;

  CharacterDataSource() : _dio = Dio();

  @override
  Future<List<CharacterDTO>> getCharacters() async {
    final response = await _dio.get('${Constants.baseUrl}/character');
    final results = response.data['results'] as List;
    return results
        .map((character) => CharacterDTO.fromJson(character))
        .toList();
  }

  @override
  Future<CharacterDTO> getCharacterById(int id) async {
    final response = await _dio.get('${Constants.baseUrl}/character/$id');
    return CharacterDTO.fromJson(response.data);
  }
}
