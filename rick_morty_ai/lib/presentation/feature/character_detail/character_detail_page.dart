import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_ai/core/dependency_injection/locator.dart';
import 'package:rick_morty_ai/domain/entity/character/character.dart';
import 'package:rick_morty_ai/domain/use_case/feature_use_cases/character_detail/character_detail_use_cases.dart';
import 'package:rick_morty_ai/presentation/feature/character_detail/bloc/character_detail_bloc.dart';
import 'package:rick_morty_ai/core/exceptions/custom_exception.dart';

class CharacterDetailPage extends StatelessWidget {
  final int id;

  const CharacterDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterDetailBloc(useCases: locator.get<CharacterDetailUseCases>())
            ..add(CharacterDetailStarted(id: id)),
      child: const _CharacterDetailView(),
    );
  }
}

class _CharacterDetailView extends StatelessWidget {
  const _CharacterDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Detail')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
      builder: (context, state) {
        return switch (state) {
          CharacterDetailInitial() ||
          CharacterDetailLoadInProgress() =>
            _loadingBody(),
          CharacterDetailLoadSuccess() =>
            _CharacterDetailContent(character: state.character),
          CharacterDetailLoadFailure() =>
            _errorBody(exception: state.exception),
        };
      },
    );
  }

  Widget _loadingBody() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorBody({required CustomException exception}) {
    return Center(
      child: Text(exception.message),
    );
  }
}

class _CharacterDetailContent extends StatelessWidget {
  final Character character;

  const _CharacterDetailContent({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'character_${character.id}',
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(character.image),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoRow('Name', character.name),
          _buildInfoRow('Status', character.status),
          _buildInfoRow('Species', character.species),
          if (character.type.isNotEmpty) _buildInfoRow('Type', character.type),
          _buildInfoRow('Gender', character.gender),
          _buildInfoRow('Origin', character.origin.name),
          _buildInfoRow('Location', character.location.name),
          const SizedBox(height: 16),
          Text(
            'Episodes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text('Appears in ${character.episode.length} episodes'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
