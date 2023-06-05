part of 'wxarticle_bloc.dart';

class WxArticleState extends Equatable {
  final int selectedIndex;
  final List<ArticleData> articles;
  final List<TreeNodeData> tabs;
  const WxArticleState({
    this.selectedIndex = 0,
    this.articles = const [],
    this.tabs = const [],
  });

  WxArticleState copyWith(
      {int? selectedIndex,
      List<ArticleData>? articles,
      List<TreeNodeData>? tabs}) {
    return WxArticleState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      articles: articles ?? this.articles,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  List<Object> get props => [selectedIndex, articles, tabs];
}
