part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  const CharacterInitial();
  @override
  List<Object> get props => [];
}

class CharacterLoading extends CharacterState {
  const CharacterLoading();
  @override
  List<Object> get props => [];
}

class CharacterLoaded extends CharacterState {
  final CharactersModel characterModel;
  const CharacterLoaded(this.characterModel);
  @override
  List<Object> get props => [characterModel];
}

class CharacterError extends CharacterState {
  final String message;
  const CharacterError(this.message);
  @override
  List<Object> get props => [message];
}
