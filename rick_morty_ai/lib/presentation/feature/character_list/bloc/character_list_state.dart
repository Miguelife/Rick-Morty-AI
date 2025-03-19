import 'package:rick_morty_ai/domain/entity/character/character.dart';

sealed class CharacterListState {}

class CharacterListInitial extends CharacterListState {}

class CharacterListLoadInProgress extends CharacterListState {}

class CharacterListLoadSuccess extends CharacterListState {
  final List<Character> characters;

  CharacterListLoadSuccess({required this.characters});
}
