part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class ArticleEventLoadData extends ArticleEvent {
  const ArticleEventLoadData({this.params});
  final Map params;
}
