part of 'project_bloc.dart';

class ProjectState extends Equatable {
  final int selectedIndex;
  final List<ArticleData> articles;
  final List<TreeNodeData> tabs;
  const ProjectState({
    this.selectedIndex = 0,
    this.articles = const [],
    this.tabs = const [],
  });

  ProjectState copyWith(
      {int selectedIndex,
      List<ArticleData> articles,
      List<TreeNodeData> tabs}) {
    return ProjectState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      articles: articles ?? this.articles,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  List<Object> get props => [selectedIndex, articles, tabs];
}
