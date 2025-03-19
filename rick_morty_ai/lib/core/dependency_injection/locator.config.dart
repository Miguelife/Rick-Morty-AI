// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_morty_ai/core/exceptions/app_exception_handler.dart'
    as _i220;
import 'package:rick_morty_ai/core/navigation/navigation_service.dart' as _i864;
import 'package:rick_morty_ai/core/navigation/navigation_service_interface.dart'
    as _i896;
import 'package:rick_morty_ai/data/repository/character/character_repository.dart'
    as _i848;
import 'package:rick_morty_ai/data/repository/character/mapper/character_mapper.dart'
    as _i182;
import 'package:rick_morty_ai/data/source/character/character_data_source.dart'
    as _i911;
import 'package:rick_morty_ai/data/source/character/character_data_source_interface.dart'
    as _i422;
import 'package:rick_morty_ai/domain/repository/character/character_repository_interface.dart'
    as _i180;
import 'package:rick_morty_ai/domain/use_case/character/get_character_by_id_use_case.dart'
    as _i115;
import 'package:rick_morty_ai/domain/use_case/character/get_characters_use_case.dart'
    as _i335;
import 'package:rick_morty_ai/domain/use_case/feature_use_cases/character_detail/character_detail_use_cases.dart'
    as _i807;
import 'package:rick_morty_ai/domain/use_case/feature_use_cases/character_list/character_list_use_cases.dart'
    as _i706;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i220.AppExceptionHandler>(() => _i220.AppExceptionHandler());
    gh.factory<_i182.CharacterMapper>(() => _i182.CharacterMapper());
    gh.factory<_i422.CharacterDataSourceInterface>(
        () => _i911.CharacterDataSource());
    gh.singleton<_i896.NavigationServiceInterface>(
        () => _i864.NavigationService());
    gh.factory<_i180.CharacterRepositoryInterface>(
        () => _i848.CharacterRepository(
              dataSource: gh<_i422.CharacterDataSourceInterface>(),
              mapper: gh<_i182.CharacterMapper>(),
              exceptionHandler: gh<_i220.AppExceptionHandler>(),
            ));
    gh.factory<_i335.GetCharactersUseCase>(() => _i335.GetCharactersUseCase(
        repository: gh<_i180.CharacterRepositoryInterface>()));
    gh.factory<_i115.GetCharacterByIdUseCase>(() =>
        _i115.GetCharacterByIdUseCase(
            repository: gh<_i180.CharacterRepositoryInterface>()));
    gh.factory<_i807.CharacterDetailUseCases>(() =>
        _i807.CharacterDetailUseCases(
            getCharacterById: gh<_i115.GetCharacterByIdUseCase>()));
    gh.factory<_i706.CharacterListUseCases>(() => _i706.CharacterListUseCases(
        getCharacters: gh<_i335.GetCharactersUseCase>()));
    return this;
  }
}
