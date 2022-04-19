import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/src/blocs/character_list_bloc/character_bloc.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';

class MySearchDelegate extends SearchDelegate {
  final CharacterBloc _newsBloc = CharacterBloc(const CharacterInitial());

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    _newsBloc.add(GetCharacterList());

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is CharacterError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
              if (state is CharacterInitial) {
                return _buildLoading();
              } else if (state is CharacterLoading) {
                return _buildLoading();
              } else if (state is CharacterLoaded) {
                return _buildCard(context, state.characterModel);
              } else if (state is CharacterError) {
                return Text(state.message);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CharactersModel model) {
    List<Results> suggestions2 = model.results.where((searchResult) {
      final result = searchResult.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions2.length,
      itemBuilder: (context, index) {
        final suggestions = suggestions2[index];
        return ListTile(
            title: Text(suggestions.name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(suggestions.image),
            ),
            onTap: () {
              query = suggestions.name;
              showResults(context);
            });
      },
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
