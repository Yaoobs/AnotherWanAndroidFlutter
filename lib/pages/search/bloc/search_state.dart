part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<HotKeyData> hotKeys;
  final List<ArticleData> articles;
  final bool noMore;
  const SearchState({
    this.hotKeys = const [],
    this.articles = const [],
    this.noMore = false,
  }) : super();

  SearchState copyWith({
    List<HotKeyData>? hotKeys,
    List<ArticleData>? articles,
    bool? noMore,
  }) {
    return SearchState(
      hotKeys: hotKeys ?? this.hotKeys,
      articles: articles ?? this.articles,
      noMore: noMore ?? this.noMore,
    );
  }

  @override
  List<Object> get props => [hotKeys, articles, noMore];
}
