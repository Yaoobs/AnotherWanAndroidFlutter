part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class GetBannerData extends ArticleEvent {
  const GetBannerData();
}

class GetArticleData extends ArticleEvent {
  const GetArticleData({required this.params});
  final Map params;
}
