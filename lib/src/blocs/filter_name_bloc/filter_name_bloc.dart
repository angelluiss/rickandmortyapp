import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/models/file_name_model.dart';
import 'package:rickandmortyapp/src/respository/api_repository.dart';

part 'filter_name_event.dart';
part 'filter_name_state.dart';

class FilterNameBloc extends Bloc<FilterNameEvent, FilterNameState> {
  final ApiRepository _apiRepository = ApiRepository();

  FilterNameBloc(FilterNameState initialState) : super(initialState);

  FilterNameState get initialState => const FilterNameInitial();

  @override
  Stream<FilterNameState> mapEventToState(
    FilterNameEvent event,
  ) async* {
    if (event is GetFilterNameList) {
      try {
        yield const FilterNameLoading();
        final mList = await _apiRepository.getName(event.name);
        yield FilterNameLoaded(mList);
        if (mList.error.isNotEmpty) yield FilterNameError(mList.error);
      } on NetworkError {
        yield const FilterNameError(
            "Failed to fetch data. is your device online?");
      }
    }
  }
}
