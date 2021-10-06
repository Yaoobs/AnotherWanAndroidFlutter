part of 'treeitems_bloc.dart';

class TreeItemsState extends Equatable {
  final int selectedIndex;
  final List<ArticleData> articles;
  const TreeItemsState({
    this.selectedIndex = 0,
    this.articles = const [],
  });

  TreeItemsState copyWith(
      {int selectedIndex, List<ArticleData> articles}) {
    return TreeItemsState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [selectedIndex, articles];
}
