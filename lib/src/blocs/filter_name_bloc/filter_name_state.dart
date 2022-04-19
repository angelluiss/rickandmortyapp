part of 'filter_name_bloc.dart';

abstract class FilterNameState extends Equatable {
  const FilterNameState();
}

class FilterNameInitial extends FilterNameState {
  const FilterNameInitial();
  @override
  List<Object> get props => [];
}

class FilterNameLoading extends FilterNameState {
  const FilterNameLoading();
  @override
  List<Object> get props => [];
}

class FilterNameLoaded extends FilterNameState {
  final CharactersModel filterNameModel;
  const FilterNameLoaded(this.filterNameModel);
  @override
  List<Object> get props => [filterNameModel];
}

class FilterNameError extends FilterNameState {
  final String message;
  const FilterNameError(this.message);
  @override
  List<Object> get props => [message];
}
