import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_ai/core/exceptions/custom_exception.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/domain/use_case/feature_use_cases/character_detail/character_detail_use_cases.dart';

sealed class CharacterDetailEvent {}

class CharacterDetailStarted extends CharacterDetailEvent {
  final int id;

  CharacterDetailStarted({required this.id});
}

sealed class CharacterDetailState {}

class CharacterDetailInitial extends CharacterDetailState {}

class CharacterDetailLoadInProgress extends CharacterDetailState {}

class CharacterDetailLoadSuccess extends CharacterDetailState {
  final Character character;

  CharacterDetailLoadSuccess({required this.character});
}

class CharacterDetailLoadFailure extends CharacterDetailState {
  final CustomException exception;

  CharacterDetailLoadFailure({required this.exception});
}

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final CharacterDetailUseCases _useCases;

  CharacterDetailBloc({
    required CharacterDetailUseCases useCases,
  })  : _useCases = useCases,
        super(CharacterDetailInitial()) {
    on<CharacterDetailEvent>((event, emit) async {
      await switch (event) {
        CharacterDetailStarted e => _onStarted(e, emit),
      };
    });
  }

  Future<void> _onStarted(
    CharacterDetailStarted event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(CharacterDetailLoadInProgress());

    try {
      final character = await _useCases.getCharacterById.call(event.id);
      emit(CharacterDetailLoadSuccess(character: character));
    } catch (exception) {
      final customException = CustomException.from(exception);
      emit(CharacterDetailLoadFailure(exception: customException));
    }
  }
}
