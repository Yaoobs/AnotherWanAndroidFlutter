part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final List<BannerData> banners;
  const ArticleState({
    this.banners = const [],
  }) : super();

  ArticleState copyWith({
    List<BannerData> banners,
  }) {
    return ArticleState(
      banners: banners ?? this.banners,
    );
  }

  @override
  List<Object> get props => [banners];
}
