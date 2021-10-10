part of 'collect_bloc.dart';

class CollectState extends Equatable {
  final List<ArticleData> articles;
  const CollectState({
    this.articles = const [],
  });

  CollectState copyWith({List<ArticleData> articles}) {
    return CollectState(
      articles: articles ?? this.articles
    );
  }

  @override
  List<Object> get props => [articles];
}
