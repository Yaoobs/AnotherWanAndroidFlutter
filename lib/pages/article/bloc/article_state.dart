part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final List<BannerData> banners;
  final List<ArticleData> articles;
  final bool noMore;
  final bool? loadBanners;
  final bool? loadArticles;
  const ArticleState({
    this.banners = const [],
    this.articles = const [],
    this.noMore = false,
    this.loadBanners = false,
    this.loadArticles = false,
  }) : super();

  ArticleState copyWith({
    List<BannerData>? banners,
    List<ArticleData>? articles,
    bool? noMore,
    bool? loadArticles,
  }) {
    return ArticleState(
      banners: banners ?? this.banners,
      articles: articles ?? this.articles,
      noMore: noMore ?? this.noMore,
      loadBanners: banners != null ? true : false,
      loadArticles: articles != null ? true : false,
    );
  }

  @override
  List<Object> get props => [banners, articles, noMore];
}
