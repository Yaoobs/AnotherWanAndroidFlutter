part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<HotKeyData> hotKeys;
  const SearchState({
    this.hotKeys = const [],
  }) : super();

  SearchState copyWith({
    List<HotKeyData> hotKeys,
  }) {
    return SearchState(
      hotKeys: hotKeys ?? this.hotKeys,
    );
  }

  @override
  List<Object> get props => [hotKeys];
}
