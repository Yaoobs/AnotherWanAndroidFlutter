part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetHotKeys extends SearchEvent {
  const GetHotKeys();
}

class GetSearchResult extends SearchEvent {
  const GetSearchResult({required this.params});
  final Map params;
}
