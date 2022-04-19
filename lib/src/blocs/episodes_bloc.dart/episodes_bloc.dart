import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmortyapp/src/models/episodes_model.dart';

import 'package:rickandmortyapp/src/respository/api_repository.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final ApiRepository _apiRepository = ApiRepository();

  EpisodesBloc(EpisodesState initialState) : super(initialState);

  EpisodesState get initialState => const EpisodesInitial();

  @override
  Stream<EpisodesState> mapEventToState(
    EpisodesEvent event,
  ) async* {
    if (event is GetEpisodesList) {
      try {
        yield const EpisodesLoading();
        final mList = await _apiRepository.getEpisodesDetail(event.episodeURL);
        yield EpisodesLoaded(mList);
        if (mList.error.isNotEmpty) yield EpisodesError(mList.error);
      } on NetworkError {
        yield const EpisodesError(
            "Failed to fetch data. is your device online?");
      }
    }
  }
}
