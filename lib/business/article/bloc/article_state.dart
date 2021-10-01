part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final List<BannerData> banners;
  final List<ArticleData> articles;
  final bool noMore;
  const ArticleState({
    this.banners = const [],
    this.articles = const [],
    this.noMore = false,
  }) : super();

  ArticleState copyWith({
    List<BannerData> banners,
    List<ArticleData> articles,
    bool noMore,
  }) {
    return ArticleState(
      banners: banners ?? this.banners,
      articles: articles ?? this.articles,
      noMore: noMore ?? this.noMore,
    );
  }

  @override
  List<Object> get props => [banners, articles, noMore];
}
