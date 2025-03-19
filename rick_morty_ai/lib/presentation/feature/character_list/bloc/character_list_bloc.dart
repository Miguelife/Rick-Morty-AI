import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_ai/core/navigation/navigation_service_interface.dart';
import 'package:rick_morty_ai/domain/use_case/feature_use_cases/character_list/character_list_use_cases.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/bloc/character_list_event.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/bloc/character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final NavigationServiceInterface _navigationService;
  final CharacterListUseCases _characterUseCases;

  CharacterListBloc({
    required CharacterListUseCases characterUseCases,
    required NavigationServiceInterface navigationService,
  })  : _characterUseCases = characterUseCases,
        _navigationService = navigationService,
        super(CharacterListInitial()) {
    on<CharacterListStarted>(_onCharacterListStarted);
  }

  Future<void> _onCharacterListStarted(
    CharacterListStarted event,
    Emitter<CharacterListState> emit,
  ) async {
    emit(CharacterListLoadInProgress());
    try {
      final characters = await _characterUseCases.getCharacters();
      emit(CharacterListLoadSuccess(characters: characters));
    } catch (exception) {
      _navigationService.showExceptionDialog(exception);
    }
  }
}
