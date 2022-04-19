part of 'episodes_bloc.dart';

abstract class EpisodesEvent extends Equatable {
  const EpisodesEvent();
}

class GetEpisodesList extends EpisodesEvent {
  late String episodeURL = "";

  GetEpisodesList(this.episodeURL);
  @override
  List<Object> get props => [];
}
