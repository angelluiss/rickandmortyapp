part of 'filter_name_bloc.dart';

abstract class FilterNameEvent extends Equatable {
  const FilterNameEvent();
}

class GetFilterNameList extends FilterNameEvent {
  late String name = "rick";

  GetFilterNameList(this.name);
  @override
  List<Object> get props => [];
}
