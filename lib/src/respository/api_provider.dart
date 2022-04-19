import 'package:dio/dio.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/models/file_name_model.dart';
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

  Future<FilterNameModel> getName(String name) async {
    print(
        "End point ${Constanst.url + Constanst.endpointCharacter + Constanst.endpointNameFilter + name}");
    try {
      Response response = await _dio.get(Constanst.url +
          Constanst.endpointCharacter +
          Constanst.endpointNameFilter +
          name);
      return FilterNameModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FilterNameModel.withError("Data not found / Connection issue");
    }
  }

  // Future<USDBalanceModel> getUSDMonitor() async {
  //   String token = await BCVPreferences.getToken();
  //   dynamic body = {'currencyType': 'USD', 'valueType': 'valuebuy'};
  //   try {
  //     _dio.options.headers["x-token"] = token;
  //     Response response =
  //         await _dio.post(_urlBCV + _balanceEndPoint, data: body);
  //     print(response.data);
  //     return USDBalanceModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return USDBalanceModel.withError("Data not found / Connection issue");
  //   }
  // }

}
