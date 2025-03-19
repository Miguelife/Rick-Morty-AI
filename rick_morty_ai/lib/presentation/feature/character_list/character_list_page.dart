import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_ai/core/dependency_injection/locator.dart';
import 'package:rick_morty_ai/core/navigation/navigation_service_interface.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/presentation/feature/character_detail/character_detail_page.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/bloc/character_list_bloc.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/bloc/character_list_event.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/bloc/character_list_state.dart';

import '../../../domain/use_case/feature_use_cases/character_list/character_list_use_cases.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterListBloc(
        navigationService: locator.get<NavigationServiceInterface>(),
        characterUseCases: locator.get<CharacterListUseCases>(),
      )..add(CharacterListStarted()),
      child: _CharacterListView(),
    );
  }
}

class _CharacterListView extends StatelessWidget {
  const _CharacterListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty Characters'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      builder: (context, state) {
        return switch (state) {
          CharacterListInitial() ||
          CharacterListLoadInProgress() =>
            _inProgressBody(),
          CharacterListLoadSuccess() =>
            _successBody(characters: state.characters),
        };
      },
    );
  }

  Widget _inProgressBody() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _successBody({required List<Character> characters}) {
    return _CharacterGrid(
      characters: characters,
    );
  }
}

class _CharacterGrid extends StatelessWidget {
  final List<Character> characters;

  const _CharacterGrid({required this.characters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return _CharacterCard(character: character);
      },
    );
  }
}

class _CharacterCard extends StatelessWidget {
  final Character character;

  const _CharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCharacterTapped(context),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'character_${character.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  character.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCharacterTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CharacterDetailPage(id: character.id),
      ),
    );
  }
}
