import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/respository/api_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CovidBloc extends Bloc<CharacterEvent, CharacterState> {
  final ApiRepository _apiRepository = ApiRepository();

  CovidBloc(CharacterState initialState) : super(initialState);

  CharacterState get initialState => const CharacterInitial();

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is GetCharacterList) {
      try {
        yield const CharacterLoading();
        final mList = await _apiRepository.getCharacters();
        yield CharacterLoaded(mList);
        if (mList.error != null) yield CharacterError(mList.error);
      } on NetworkError {
        yield const CharacterError(
            "Failed to fetch data. is your device online?");
      }
    }
  }
}
