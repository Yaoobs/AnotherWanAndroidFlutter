part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchEventLoadHotKeys extends SearchEvent {
  const SearchEventLoadHotKeys();
}

class SearchEventSearchAction extends SearchEvent {
  const SearchEventSearchAction({required this.params});
  final Map params;
}
