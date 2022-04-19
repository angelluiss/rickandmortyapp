part of 'episodes_bloc.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();
}

class EpisodesInitial extends EpisodesState {
  const EpisodesInitial();
  @override
  List<Object> get props => [];
}

class EpisodesLoading extends EpisodesState {
  const EpisodesLoading();
  @override
  List<Object> get props => [];
}

class EpisodesLoaded extends EpisodesState {
  final EpisodesModel episodesModel;
  const EpisodesLoaded(this.episodesModel);
  @override
  List<Object> get props => [EpisodesModel];
}

class EpisodesError extends EpisodesState {
  final String message;
  const EpisodesError(this.message);
  @override
  List<Object> get props => [message];
}
