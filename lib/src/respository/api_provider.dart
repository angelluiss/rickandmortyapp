import 'package:dio/dio.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/models/episodes_model.dart';
import 'package:rickandmortyapp/src/utils/constanst.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<CharactersModel> getCharacters() async {
    try {
      Response response =
          await _dio.get(Constanst.url + Constanst.endpointCharacter);
      return CharactersModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CharactersModel.withError("Data not found / Connection issue");
    }
  }

  Future<CharactersModel> getName(String name) async {
    print(
        "End point ${Constanst.url + Constanst.endpointCharacter + Constanst.endpointNameFilter + name}");
    try {
      Response response = await _dio.get(Constanst.url +
          Constanst.endpointCharacter +
          Constanst.endpointNameFilter +
          name);
      return CharactersModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CharactersModel.withError("Data not found / Connection issue");
    }
  }

  Future<EpisodesModel> getEpisodesDetail(String episode) async {
    print("End point ${episode}");
    try {
      Response response = await _dio.get(episode);
      return EpisodesModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return EpisodesModel.withError("Data not found / Connection issue");
    }
  }
}
