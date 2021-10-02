part of 'tree_bloc.dart';

class TreeState extends Equatable {
  final int selectedIndex;
  final List<String> tabs;

  const TreeState({
    this.tabs = const ['体系', '导航'],
    this.selectedIndex = 0,
  });

  TreeState copyWith({
    List<String> tabs,
    int selectedIndex,
  }) {
    return TreeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  List<Object> get props => [selectedIndex, tabs];
}
