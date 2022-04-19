import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/src/blocs/filter_name_bloc/filter_name_bloc.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';

import 'package:rickandmortyapp/src/ui/screens/character_page.dart';

class MySearchDelegate extends SearchDelegate {
  final FilterNameBloc _newsBloc = FilterNameBloc(const FilterNameInitial());

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
    _newsBloc.add(GetFilterNameList(query.toLowerCase()));

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<FilterNameBloc, FilterNameState>(
          listener: (context, state) {
            if (state is FilterNameError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<FilterNameBloc, FilterNameState>(
            builder: (context, state) {
              if (state is FilterNameInitial) {
                return _buildLoading();
              } else if (state is FilterNameLoading) {
                return _buildLoading();
              } else if (state is FilterNameLoaded) {
                return _buildCard(context, state.filterNameModel);
              } else if (state is FilterNameError) {
                return Text(state.message);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CharactersModel model2) {
    List<Results> suggestions2 = model2.results.where((searchResult) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterPage(
                            model: model2,
                            index: index,
                          )));
            });
      },
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
