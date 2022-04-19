import 'package:rickandmortyapp/src/blocs/filter_name_bloc/filter_name_bloc.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/models/episodes_model.dart';
import 'package:rickandmortyapp/src/models/file_name_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CharactersModel> getCharacters() {
    return _provider.getCharacters();
  }

  Future<CharactersModel> getName(String name) {
    return _provider.getName(name);
  }

  Future<EpisodesModel> getEpisodesDetail(String name) {
    return _provider.getEpisodesDetail(name);
  }
}

class NetworkError extends Error {}
