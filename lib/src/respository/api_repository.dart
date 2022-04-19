import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CharactersModel> getCharacters() {
    return _provider.getCharacters();
  }

  // Future<USDBalanceModel> getEURBCVMonitor() {
  //   return _provider.getEURMonitor();
  // }

}

class NetworkError extends Error {}
