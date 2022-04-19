import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/src/blocs/character_list_bloc/character_bloc.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/ui/widgets/card_character.dart';

class CharactersList extends StatefulWidget {
  CharactersList({Key? key}) : super(key: key);

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final CharacterBloc _newsBloc = CharacterBloc(const CharacterInitial());

  @override
  void initState() {
    _newsBloc.add(GetCharacterList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return ListView.builder(
      itemCount: model.results.length,
      itemBuilder: (context, index) {
        return CardCharacter(
          model: model,
          index: index,
        );
      },
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
